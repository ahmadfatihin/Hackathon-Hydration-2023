import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_hydration/features/login/presentation/pages/login_pages.dart';
import 'package:hackathon_hydration/features/splash/presentation/pages/splash_page.dart';
import 'package:hackathon_hydration/features/welcome/presentation/pages/welcome_page.dart';

class RoutesConfig {
  static GoRouter appRouter =
      GoRouter(initialLocation: splash, routes: <GoRoute>[
    GoRoute(
      path: splash,
      builder: (ctx, state) => const SplashPage(),
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
    GoRoute(
      path: welcome,
      builder: (ctx, state) => const WelcomePage(),
    ),
  ]);
  static String login = '/login';
  static String splash = '/splash';
  static String welcome = '/welcome';
}
