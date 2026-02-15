import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_my_day/data/providers/database_provider.dart';
import 'package:plan_my_day/presentation/onboarding/onboarding_screen.dart';
import 'package:plan_my_day/presentation/settings/settings_screen.dart';
import 'package:plan_my_day/presentation/home/home_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
        redirect: (context, state) async {
            final db = ref.read(databaseProvider);
            final settings = await (db.select(db.settings)..where((t) => t.id.equals(1))).getSingleOrNull();
            if (settings?.isSetupComplete == true) {
              return '/home';
            }
            return null; 
        }
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
        routes: [],
      ),
    ],
  );
}
