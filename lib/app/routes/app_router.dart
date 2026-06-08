import 'package:doodiary/app/routes/app_shell.dart';
import 'package:doodiary/features/calendar/screens/calendar_screen.dart';
import 'package:doodiary/features/insights/screens/insights_screen.dart';
import 'package:doodiary/features/journal/screens/journal_screen.dart';
import 'package:doodiary/features/record/screens/record_screen.dart';
import 'package:doodiary/features/settings/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

/// アプリ全体のルート定義。
/// ShellRoute でボトムナビを共有し、その上に record などのフルスクリーンを重ねる構造。
final appRouter = GoRouter(
  initialLocation: AppRoute.journal,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoute.journal,
          builder: (context, state) {
            return const JournalScreen();
          },
        ),
        GoRoute(
          path: AppRoute.insights,
          builder: (context, state) {
            return const InsightsScreen();
          },
        ),
        GoRoute(
          path: AppRoute.calendar,
          builder: (context, state) {
            return const CalendarScreen();
          },
        ),
        GoRoute(
          path: AppRoute.settings,
          builder: (context, state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
    // ボトムナビを非表示にするフルスクリーン画面
    GoRoute(
      path: AppRoute.record,
      builder: (context, state) {
        return const RecordScreen();
      },
    ),
  ],
);

/// パス定数。文字列の直書きを防ぐ。
abstract final class AppRoute {
  static const String journal = '/';
  static const String insights = '/insights';
  static const String calendar = '/calendar';
  static const String settings = '/settings';
  static const String record = '/record';
}
