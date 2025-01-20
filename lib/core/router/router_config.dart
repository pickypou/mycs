import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/mov_combat/mov_combat_module.dart';
import 'package:mycs/ui/moving/moving_module.dart';
import 'package:mycs/ui/moving_show/moving_show_module.dart';
import 'package:mycs/ui/step_mov/step_mov_module.dart';
import 'package:mycs/ui/view_all/view_all_module.dart';
import '../../core/di/di.dart';
import '../../ui/zen_moving/zen_moving_module.dart';


@singleton
class AppRouterConfig {
  GoRouter get router => GoRouter(
    routes: [
      ...getIt<ViewAllModule>().getRoutes(),
      ...getIt<MovingModule>().getRoutes(),
      ...getIt<ZenMovingModule>().getRoutes(),
      ...getIt<StepMovModule>().getRoutes(),
      ...getIt<MovingShowModule>().getRoutes(),
      ...getIt<MovCombatModule>().getRoutes()
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}


class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}