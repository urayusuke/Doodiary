import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// DiaryRecord のローカルキャッシュテーブル。
/// Supabase と同期するまでの一次保存先として機能する。
class DiaryRecordsTable extends Table {
  // Drift のコードジェネレーターはカラム定義に => 構文を必須とする。
  // CLAUDE.md の「=> 禁止」ルールの例外として、テーブル定義クラス内に限り => を使う。

  @override
  String get tableName => 'diary_records';

  /// Drift が型安全な DataClass を生成するために PK が必要。
  /// アプリ内のフィルタは recordedAt で行うため、この値は直接使わない。
  IntColumn get rowId => integer().autoIncrement()();

  /// Supabase UUID。Supabase に同期する前は null になる。
  TextColumn get id => text().nullable()();

  /// 記録日時。UTC で保存し、読み出し時にローカル時刻に変換する。
  DateTimeColumn get recordedAt => dateTime()();

  /// 感情スライダー値（0.0〜1.0）
  RealColumn get moodSlider => real()();

  /// 気分カラーの ARGB 値。未選択時は null。
  IntColumn get moodColor => integer().nullable()();

  /// WeatherMeta の enum name 文字列。未選択時は null。
  TextColumn get weather => text().nullable()();

  /// List を JSON 文字列として格納する。
  /// SQLite に配列型がないため、1カラムに JSON で持つ。
  TextColumn get bodyParts => text().withDefault(const Constant('[]'))();

  TextColumn get sketchPath => text().nullable()();

  TextColumn get photoPath => text().nullable()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [DiaryRecordsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// テスト用。インメモリ DB や任意の executor を直接渡せるようにする。
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'doodiary');
  }
}
