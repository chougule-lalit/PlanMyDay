import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_my_day/core/router/app_router.dart';
import 'package:plan_my_day/core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: PlanMyDayApp()));
}

class PlanMyDayApp extends ConsumerWidget {
  const PlanMyDayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Plan My Day',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
