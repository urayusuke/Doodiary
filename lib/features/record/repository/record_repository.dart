import 'dart:convert';

import 'package:doodiary/app/services/app_database.dart';
import 'package:doodiary/app/services/supabase_service.dart';
import 'package:doodiary/common/constants/app_strings.dart';
import 'package:doodiary/features/record/models/diary_record.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

/// DiaryRecord の永続化を担う。
/// ローカル（Drift）を一次保存先とし、オンライン時に Supabase へ同期する。
class RecordRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  RecordRepository(this._db);

  // ----------------------------------------------------------------
  // Public API
  // ----------------------------------------------------------------

  /// Drift にローカル保存する。
  /// saveLocally 時点でクライアント UUID を生成することで、
  /// Supabase 同期後のクラッシュによる重複 INSERT を防ぐ。
  Future<void> saveLocally(DiaryRecord record) async {
    final id = record.id ?? _uuid.v4();

    final companion = DiaryRecordsTableCompanion(
      id: Value(id),
      recordedAt: Value(record.recordedAt),
      moodSlider: Value(record.moodSlider),
      moodColor: Value(record.moodColor),
      weather: Value(record.weather?.name),
      bodyParts: Value(_encodeBodyParts(record.bodyParts)),
      sketchPath: Value(record.sketchPath),
      photoPath: Value(record.photoPath),
      isSynced: const Value(false),
    );

    await _db.into(_db.diaryRecordsTable).insert(
          companion,
          mode: InsertMode.insertOrReplace,
        );
  }

  /// Supabase にアップサート後、Drift の isSynced フラグを更新する。
  /// クライアント生成の id を upsert キーとして使うため、重複 INSERT は起きない。
  /// オフライン時は例外を伝播させ、呼び出し元（state 層）が再試行を判断する。
  Future<void> syncToSupabase(DiaryRecord record) async {
    // saveLocally 後は必ず id が入っている前提
    assert(record.id != null, 'syncToSupabase は saveLocally 後に呼ぶこと');

    final payload = _toSupabaseMap(record);

    await SupabaseService.client
        .from(AppStrings.tableNameDiaryRecords)
        .upsert(payload)
        .select()
        .single();

    // id ベースで WHERE することで recordedAt の衝突を回避する
    await (_db.update(_db.diaryRecordsTable)
          ..where((t) => t.id.equals(record.id!)))
        .write(
      const DiaryRecordsTableCompanion(
        isSynced: Value(true),
      ),
    );

    debugPrint('Supabase 同期完了: id=${record.id}');
  }

  /// 直近 N 日分のレコードを Drift から降順取得する。
  /// Pro / 無料の期間制限は呼び出し元（state 層）が days で制御する。
  Future<List<DiaryRecord>> fetchRecent(int days) async {
    final since = DateTime.now().subtract(Duration(days: days));

    final query = _db.select(_db.diaryRecordsTable)
      ..where((t) => t.recordedAt.isBiggerOrEqualValue(since))
      ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]);

    final rows = await query.get();
    return rows.map(_rowToRecord).toList();
  }

  /// 指定日 0:00〜24:00 の記録をリアルタイム監視する。
  /// 呼び出し側が日付を渡すことで、0時跨ぎ時に Riverpod 層でストリームを再生成できる。
  Stream<List<DiaryRecord>> watchRecordsAt(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final query = _db.select(_db.diaryRecordsTable)
      ..where(
        (t) =>
            t.recordedAt.isBiggerOrEqualValue(startOfDay) &
            t.recordedAt.isSmallerThanValue(endOfDay),
      )
      ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]);

    return query.watch().map((rows) => rows.map(_rowToRecord).toList());
  }

  // ----------------------------------------------------------------
  // 変換ロジック（Private）
  // ----------------------------------------------------------------

  /// Drift の Row → DiaryRecord への変換。
  /// Freezed モデルに DB マッピングを持たせない規約のため、ここで担う。
  DiaryRecord _rowToRecord(DiaryRecordsTableData row) {
    return DiaryRecord(
      id: row.id,
      recordedAt: row.recordedAt,
      moodSlider: row.moodSlider,
      moodColor: row.moodColor,
      weather: _decodeWeather(row.weather),
      bodyParts: _decodeBodyParts(row.bodyParts),
      sketchPath: row.sketchPath,
      photoPath: row.photoPath,
      isSynced: row.isSynced,
    );
  }

  /// DiaryRecord → Supabase upsert 用 Map への変換。
  Map<String, dynamic> _toSupabaseMap(DiaryRecord record) {
    return {
      'id': record.id,
      'recorded_at': record.recordedAt.toUtc().toIso8601String(),
      'mood_slider': record.moodSlider,
      'mood_color': record.moodColor,
      'weather': record.weather?.name,
      'body_parts': record.bodyParts,
      'sketch_path': record.sketchPath,
      'photo_path': record.photoPath,
    };
  }

  /// WeatherMeta の enum name 文字列から enum に戻す。
  /// 未知の文字列はクラッシュさせず null で返す。
  WeatherMeta? _decodeWeather(String? name) {
    if (name == null) {
      return null;
    }
    try {
      return WeatherMeta.values.byName(name);
    } catch (_) {
      debugPrint('WeatherMeta に不明な値: $name');
      return null;
    }
  }

  String _encodeBodyParts(List<String> parts) {
    return jsonEncode(parts);
  }

  /// JSON デコード失敗時は空リストにフォールバックする。
  /// DBの破損データでアプリをクラッシュさせないため。
  List<String> _decodeBodyParts(String json) {
    try {
      final decoded = jsonDecode(json) as List<dynamic>;
      return decoded.cast<String>();
    } catch (_) {
      debugPrint('bodyParts の JSON デコード失敗: $json');
      return [];
    }
  }
}
