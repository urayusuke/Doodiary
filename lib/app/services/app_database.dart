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

  /// Supabase UUID。saveLocally 時にクライアントで生成し、Supabase upsert の冪等キーとして使う。
  /// UNIQUE 制約により insertOrReplace が真に機能し、重複 INSERT を防ぐ。
  TextColumn get id => text().nullable().unique()();

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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // id カラムに UNIQUE 制約を追加。
          // SQLite は ALTER COLUMN をサポートしないため、再作成ではなくインデックスで代替する。
          await m.createIndex(
            Index(
              'diary_records_id_unique',
              'CREATE UNIQUE INDEX IF NOT EXISTS diary_records_id_unique ON diary_records (id) WHERE id IS NOT NULL',
            ),
          );
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'doodiary');
  }
}
