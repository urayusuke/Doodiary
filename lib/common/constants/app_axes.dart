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
  energy,
  stability,
  sociability,
  selfEsteem,
  stressLoad,
  complexity,
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
