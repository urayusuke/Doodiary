import 'package:doodiary/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('アプリが起動してBottomNavが表示される', (tester) async {
    // SupabaseService.initialize() はテスト環境では --dart-define が通らないためスキップし、
    // ルーティングとウィジェットツリーの構造だけを検証する
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: appRouter,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
