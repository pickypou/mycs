import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycs/core/router/router_config.dart';
import 'package:mycs/ui/theme.dart';

import 'core/di/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure toutes les dépendances
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouterConfig = getIt<AppRouterConfig>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MYCS',
      theme: theme,
      routerConfig: appRouterConfig.router,
    );
  }
}


