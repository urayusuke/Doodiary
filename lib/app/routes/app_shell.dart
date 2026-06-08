import 'package:doodiary/app/routes/app_router.dart';
import 'package:doodiary/common/constants/app_colors.dart';
import 'package:doodiary/common/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// ボトムナビを持つシェル。Journal / Insights / Calendar / Settings で共有する。
class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _BottomNav(),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = _indexFromLocation(location);

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        context.go(_locationFromIndex(index));
      },
      backgroundColor: AppColors.surface,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.book_outlined),
          selectedIcon: Icon(Icons.book),
          label: AppStrings.tabJournal,
        ),
        NavigationDestination(
          icon: Icon(Icons.insights_outlined),
          selectedIcon: Icon(Icons.insights),
          label: AppStrings.tabInsights,
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: AppStrings.tabCalendar,
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: AppStrings.tabSettings,
        ),
      ],
    );
  }

  int _indexFromLocation(String location) {
    if (location.startsWith(AppRoute.insights)) {
      return 1;
    }
    if (location.startsWith(AppRoute.calendar)) {
      return 2;
    }
    if (location.startsWith(AppRoute.settings)) {
      return 3;
    }
    return 0;
  }

  String _locationFromIndex(int index) {
    switch (index) {
      case 1:
        return AppRoute.insights;
      case 2:
        return AppRoute.calendar;
      case 3:
        return AppRoute.settings;
      default:
        return AppRoute.journal;
    }
  }
}
