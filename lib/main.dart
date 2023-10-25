import 'package:flutter/material.dart';
import 'package:hackathon_hydration/features/login/presentation/pages/login_pages.dart';
import 'package:hackathon_hydration/features/onboard/presentation/pages/onboard_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/injector.dart';
import 'core/di/routes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('com.wolkk.xentral_customer_project');

  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hydration Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: RoutesConfig.appRouter,
    );
  }
}
