import 'package:doodiary/features/record/models/diary_record.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DiaryRecord', () {
    final base = DiaryRecord(
      recordedAt: DateTime(2026, 6, 13),
      moodSlider: 0.7,
    );

    test('必須フィールドだけで生成できる', () {
      expect(base.moodSlider, 0.7);
      expect(base.id, isNull);
      expect(base.moodColor, isNull);
      expect(base.weather, isNull);
      expect(base.bodyParts, isEmpty);
      expect(base.sketchPath, isNull);
      expect(base.photoPath, isNull);
      expect(base.isSynced, isFalse);
    });

    test('copyWith で部分更新できる', () {
      final updated = base.copyWith(
        moodColor: 0xFFFF6B6B,
        weather: WeatherMeta.sunny,
        isSynced: true,
      );

      expect(updated.moodSlider, 0.7);
      expect(updated.moodColor, 0xFFFF6B6B);
      expect(updated.weather, WeatherMeta.sunny);
      expect(updated.isSynced, isTrue);
    });

    test('== で値比較できる', () {
      final a = DiaryRecord(recordedAt: DateTime(2026, 6, 13), moodSlider: 0.5);
      final b = DiaryRecord(recordedAt: DateTime(2026, 6, 13), moodSlider: 0.5);
      expect(a, equals(b));
    });
  });

  group('WeatherMeta', () {
    test('各ラベルが日本語で返る', () {
      expect(WeatherMeta.sunny.label, '晴れ');
      expect(WeatherMeta.cloudy.label, '曇り');
      expect(WeatherMeta.rainy.label, '雨');
      expect(WeatherMeta.stormy.label, '嵐');
      expect(WeatherMeta.partlyCloudy.label, '晴れ時々曇り');
      expect(WeatherMeta.foggy.label, '霧');
    });
  });
}
