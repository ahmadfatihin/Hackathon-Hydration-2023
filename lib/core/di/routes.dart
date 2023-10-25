import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_hydration/features/login/presentation/pages/login_pages.dart';
import 'package:hackathon_hydration/features/onboard/presentation/pages/onboard_page.dart';

class RoutesConfig {
  static GoRouter appRouter =
      GoRouter(initialLocation: onboard, routes: <GoRoute>[
    GoRoute(
      path: onboard,
      builder: (ctx, state) => const OnboardPage(),
    ),
    GoRoute(
      path: login,
      pageBuilder: (_, state) {
        return CustomTransitionPage(
          child: LoginPage(),
          transitionDuration: const Duration(milliseconds: 1800),
          transitionsBuilder: (_, animation, __, transitionBuilder) =>
              FadeTransition(opacity: animation, child: transitionBuilder),
        );
      },
    ),
  ]);
  static String login = '/login';
  static String onboard = '/onboard';
}
