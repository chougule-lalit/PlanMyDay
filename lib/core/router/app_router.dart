import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:plan_my_day/presentation/onboarding/onboarding_screen.dart';
import 'package:plan_my_day/presentation/settings/settings_screen.dart';
import 'package:plan_my_day/presentation/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
