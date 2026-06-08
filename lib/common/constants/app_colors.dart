import 'package:flutter/material.dart';

/// アプリ全体で使う色定数
abstract final class AppColors {
  // ---- ブランドカラー ----
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFFEDECFF);

  // ---- 背景・サーフェス ----
  static const Color background = Color(0xFFF8F7FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDim = Color(0xFFF0EFF9);

  // ---- テキスト ----
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B6B8A);
  static const Color textDisabled = Color(0xFFB0B0C8);

  // ---- 感情カラーパレット（気分を色で選ぶUI用） ----
  static const List<Color> moodPalette = [
    Color(0xFF4A90E2), // 青：落ち着き
    Color(0xFF7ED321), // 緑：安心
    Color(0xFFF5A623), // オレンジ：活力
    Color(0xFFD0021B), // 赤：緊張・怒り
    Color(0xFF9013FE), // 紫：複雑
    Color(0xFF50E3C2), // ターコイズ：さわやか
    Color(0xFFFFD700), // 黄：喜び
    Color(0xFF8B8B8B), // グレー：無気力
    Color(0xFFFF6B9D), // ピンク：優しさ
    Color(0xFF2C3E50), // ダーク：重さ
  ];

  // ---- レーダーチャート ----
  static const Color radarFill = Color(0x336C63FF);
  static const Color radarBorder = Color(0xFF6C63FF);
  static const Color radarGrid = Color(0xFFDDDDF0);

  // ---- ステータス ----
  static const Color success = Color(0xFF27AE60);
  static const Color error = Color(0xFFE74C3C);
  static const Color warning = Color(0xFFF39C12);

  // ---- Pro ----
  static const Color proGold = Color(0xFFFFB300);
  static const Color proGoldLight = Color(0xFFFFF3CD);
}
