import 'package:flutter/material.dart';
import 'package:mycs/core/router/router_config.dart';
import 'package:mycs/ui/theme.dart';

import 'core/di/di.dart';

void main() {
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


