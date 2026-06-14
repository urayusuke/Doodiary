import 'package:doodiary/app/services/app_database.dart';
import 'package:doodiary/features/record/models/diary_record.dart';
import 'package:doodiary/features/record/repository/record_repository.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late RecordRepository repository;

  setUp(() {
    // インメモリ DB でテスト間の独立性を保つ
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = RecordRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('saveLocally', () {
    test('記録を Drift に保存できる', () async {
      final record = DiaryRecord(
        recordedAt: DateTime(2026, 6, 14, 10, 0),
        moodSlider: 0.7,
      );

      await repository.saveLocally(record);

      final results = await repository.fetchRecent(1);
      expect(results.length, 1);
      expect(results.first.moodSlider, 0.7);
    });

    test('isSynced は保存直後 false になる', () async {
      final record = DiaryRecord(
        recordedAt: DateTime(2026, 6, 14, 10, 0),
        moodSlider: 0.5,
        isSynced: true,
      );

      await repository.saveLocally(record);

      final results = await repository.fetchRecent(1);
      expect(results.first.isSynced, false);
    });

    test('WeatherMeta が正しく往復変換される', () async {
      final record = DiaryRecord(
        recordedAt: DateTime(2026, 6, 14, 10, 0),
        moodSlider: 0.3,
        weather: WeatherMeta.stormy,
      );

      await repository.saveLocally(record);

      final results = await repository.fetchRecent(1);
      expect(results.first.weather, WeatherMeta.stormy);
    });

    test('bodyParts が正しく往復変換される', () async {
      final record = DiaryRecord(
        recordedAt: DateTime(2026, 6, 14, 10, 0),
        moodSlider: 0.6,
        bodyParts: ['shoulder', 'chest', 'stomach'],
      );

      await repository.saveLocally(record);

      final results = await repository.fetchRecent(1);
      expect(results.first.bodyParts, ['shoulder', 'chest', 'stomach']);
    });
  });

  group('fetchRecent', () {
    test('指定日数より古い記録は返さない', () async {
      final old = DiaryRecord(
        recordedAt: DateTime.now().subtract(const Duration(days: 8)),
        moodSlider: 0.2,
      );
      final recent = DiaryRecord(
        recordedAt: DateTime.now().subtract(const Duration(days: 3)),
        moodSlider: 0.8,
      );

      await repository.saveLocally(old);
      await repository.saveLocally(recent);

      final results = await repository.fetchRecent(7);
      expect(results.length, 1);
      expect(results.first.moodSlider, 0.8);
    });

    test('新しい順で返す', () async {
      final older = DiaryRecord(
        recordedAt: DateTime(2026, 6, 12, 9, 0),
        moodSlider: 0.3,
      );
      final newer = DiaryRecord(
        recordedAt: DateTime(2026, 6, 14, 9, 0),
        moodSlider: 0.9,
      );

      await repository.saveLocally(older);
      await repository.saveLocally(newer);

      final results = await repository.fetchRecent(30);
      expect(results.first.moodSlider, 0.9);
    });
  });

  group('watchToday', () {
    test('今日の記録のみを Stream で流す', () async {
      final today = DiaryRecord(
        recordedAt: DateTime.now(),
        moodSlider: 0.5,
      );
      final yesterday = DiaryRecord(
        recordedAt: DateTime.now().subtract(const Duration(days: 1)),
        moodSlider: 0.3,
      );

      await repository.saveLocally(today);
      await repository.saveLocally(yesterday);

      final records = await repository.watchToday().first;
      expect(records.length, 1);
      expect(records.first.moodSlider, 0.5);
    });
  });
}
