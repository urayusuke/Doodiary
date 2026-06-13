import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_record.freezed.dart';

/// 1回分の日記記録。
/// 文字入力なしで感情を記録するため、すべてのフィールドが非言語入力値。
@freezed
abstract class DiaryRecord with _$DiaryRecord {
  const factory DiaryRecord({
    /// Supabase の UUID。ローカル保存中は null
    String? id,

    /// 記録日時
    required DateTime recordedAt,

    /// 感情スライダー値。0.0（どんより）〜 1.0（すっきり）
    /// 唯一の必須入力。他はすべて任意
    required double moodSlider,

    /// 気分を色で表現した ARGB 値。null = 未選択
    int? moodColor,

    /// 天気メタファー。null = 未選択
    WeatherMeta? weather,

    /// ボディマップで選択した体の部位 ID リスト。null = 未選択
    @Default([]) List<String> bodyParts,

    /// スケッチ画像のローカルパス。null = 未描画
    String? sketchPath,

    /// 写真のローカルパス。null = 未選択
    String? photoPath,

    /// Supabase に同期済みか。ローカル保存直後は false
    @Default(false) bool isSynced,
  }) = _DiaryRecord;
}

/// 天気メタファー。感情の「空模様」を直感的に選ぶ
enum WeatherMeta {
  /// 穏やかで明るい気分
  sunny,

  /// まあまあ、可もなく不可もなく
  cloudy,

  /// 重くて沈んでいる
  rainy,

  /// 不安定・イライラしている
  stormy,

  /// 少し晴れ間が見えてきた
  partlyCloudy,

  /// 霧の中にいるような、ぼんやりした気分
  foggy;

  String get label {
    switch (this) {
      case WeatherMeta.sunny:
        return '晴れ';
      case WeatherMeta.cloudy:
        return '曇り';
      case WeatherMeta.rainy:
        return '雨';
      case WeatherMeta.stormy:
        return '嵐';
      case WeatherMeta.partlyCloudy:
        return '晴れ時々曇り';
      case WeatherMeta.foggy:
        return '霧';
    }
  }
}
