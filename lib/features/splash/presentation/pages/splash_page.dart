import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_hydration/generated/assets.gen.dart';

import '../../../../core/di/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late PageController controller;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController
    controller = PageController(initialPage: 0);

    // Start the countdown for navigation to the login screen
    Future.delayed(const Duration(seconds: 2), () {
      navigateToLoginScreen();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToLoginScreen() {
    // Use Navigator to navigate to the login screen
    context.go(RoutesConfig.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Assets.logo.image(width: 300, height: 300)));
  }
}
