/// レーダーチャートの7軸定数
///
/// 順序はレーダーチャートの頂点配置順（時計回り、真上から）。
/// キー名はSupabase/Driftのカラム名と一致させる。
abstract final class AppAxes {
  static const List<Axis7> all = [
    Axis7.energy,
    Axis7.stability,
    Axis7.sociability,
    Axis7.selfEsteem,
    Axis7.stressLoad,
    Axis7.complexity,
    Axis7.positivity,
  ];
}

enum Axis7 {
  /// 今日どれだけ活動的・行動的なエネルギーを感じているか
  energy,

  /// 気分の波が穏やかで安定しているか、乱高下しているか
  stability,

  /// 人と関わりたい気持ちの強さ。内向き↔外向きの度合い
  sociability,

  /// 自分を肯定できているか。自己批判が強くないか
  selfEsteem,

  /// ストレスの重さ・圧迫感。高いほど負荷が大きい（他軸と方向が逆）
  stressLoad,

  /// 複数の感情が混在しているか。単純な感情か複雑か
  complexity,

  /// 感情全体がポジティブ寄りか、ネガティブ寄りか
  positivity;

  String get label {
    switch (this) {
      case Axis7.energy:
        return 'エネルギー';
      case Axis7.stability:
        return '安定性';
      case Axis7.sociability:
        return '社交性';
      case Axis7.selfEsteem:
        return '自己肯定感';
      case Axis7.stressLoad:
        return 'ストレス負荷';
      case Axis7.complexity:
        return '感情の複雑性';
      case Axis7.positivity:
        return 'ポジティブ度';
    }
  }

  /// Supabase / Drift のカラムキー
  String get columnKey {
    switch (this) {
      case Axis7.energy:
        return 'energy';
      case Axis7.stability:
        return 'stability';
      case Axis7.sociability:
        return 'sociability';
      case Axis7.selfEsteem:
        return 'self_esteem';
      case Axis7.stressLoad:
        return 'stress_load';
      case Axis7.complexity:
        return 'complexity';
      case Axis7.positivity:
        return 'positivity';
    }
  }
}
