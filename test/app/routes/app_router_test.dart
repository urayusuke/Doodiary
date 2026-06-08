import 'package:doodiary/app/routes/app_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRoute', () {
    test('各パス定数が正しく定義されている', () {
      expect(AppRoute.journal, '/');
      expect(AppRoute.insights, '/insights');
      expect(AppRoute.calendar, '/calendar');
      expect(AppRoute.settings, '/settings');
      expect(AppRoute.record, '/record');
    });

    test('record はボトムナビ外のパス（/ で始まる独立ルート）', () {
      // record はボトムナビのShellRouteに含まれないため、
      // journal/insights/calendar/settings とは別扱いになる。
      const shellPaths = [
        AppRoute.journal,
        AppRoute.insights,
        AppRoute.calendar,
        AppRoute.settings,
      ];
      expect(shellPaths.contains(AppRoute.record), isFalse);
    });
  });
}
