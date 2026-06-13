import 'package:doodiary/app/routes/app_router.dart';
import 'package:doodiary/app/services/supabase_service.dart';
import 'package:doodiary/common/constants/app_colors.dart';
import 'package:doodiary/common/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Supabase.initialize() などのネイティブ処理を runApp 前に呼ぶために必要
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.initialize();
  runApp(const ProviderScope(child: DooDiaryApp()));
}

class DooDiaryApp extends StatelessWidget {
  const DooDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      routerConfig: appRouter,
    );
  }
}
