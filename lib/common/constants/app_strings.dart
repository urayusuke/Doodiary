/// アプリ内の文言定数
///
/// ハードコードを防ぐため、UI上に表示する文字列はすべてここで管理する。
abstract final class AppStrings {
  // ---- アプリ共通 ----
  static const String appName = 'Doodiary';

  // ---- タブ・画面タイトル ----
  static const String tabJournal = 'Journal';
  static const String tabInsights = 'Insights';
  static const String tabCalendar = 'Calendar';
  static const String tabSettings = 'Settings';

  // ---- Journal画面 ----
  static const String dayStreak = 'DAY STREAK';
  static const String startRecord = '今日の気分を記録する';
  static const String recordDone = '今日もお疲れさま';
  static const String recordDoneMessage = '記録できたね。あとはゆっくりして。';

  // ---- 気分スライダー ----
  static const String moodLow = 'どんより';
  static const String moodHigh = 'すっきり';
  static const String moodPrompt = '今この瞬間、どんな感じ？';

  // ---- 天気メタファー ----
  static const String weatherSunny = '晴れ';
  static const String weatherCloudy = '曇り';
  static const String weatherRainy = '雨';
  static const String weatherStormy = '嵐';
  static const String weatherSnowy = '雪';
  static const String weatherFoggy = '霧';

  // ---- Insights画面 ----
  static const String insightsTitle = 'Insights';
  static const String todayInsight = '今日の気づき';
  static const String insightGenerating = '分析中...';
  static const String insightProOnly = 'Proプランで今日の気づきを見る';

  // ---- Calendar画面 ----
  static const String calendarTitle = 'Calendar';
  static const String weeklyTrend = '週の傾向';

  // ---- 設定画面 ----
  static const String settingsTitle = '設定';
  static const String accountSection = 'アカウント';
  static const String notificationSection = '通知';
  static const String planSection = 'プラン';
  static const String signInWithApple = 'Appleでサインイン';
  static const String signInWithGoogle = 'Googleでサインイン';
  static const String dataCarryOver = 'データを引き継ぐにはアカウント登録が必要です';

  // ---- Pro誘導 ----
  static const String proTitle = 'Doodiary Pro';
  static const String proTrialCta = '7日間無料で試す';
  static const String proPriceMonthly = '¥600 / 月';
  static const String proPriceYearly = '¥4,800 / 年';
  static const String proPriceYearlyNote = '月換算 ¥400・4ヶ月分おトク';
  static const String proFeature1 = '今日の気づき（AI分析）';
  static const String proFeature2 = '過去データ無制限';
  static const String proFeature3 = '週次・月次インサイト';

  // ---- エラー・ステータス ----
  static const String errorNetwork = '通信エラーが発生しました';
  static const String errorSaveFailed = '保存に失敗しました';
  static const String errorUnknown = '予期しないエラーが発生しました';
  static const String retryLabel = '再試行';
}
