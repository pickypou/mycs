import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/account/account_module.dart';
import 'package:mycs/ui/evenements/add_evenement/add_evenement_module.dart';
import 'package:mycs/ui/admin_page/admin_page_module.dart';
import 'package:mycs/ui/contact/contact_module.dart';
import 'package:mycs/ui/evenements/evenement_page/evenement_page_module.dart';
import 'package:mycs/ui/evenements/remove_evenement/remove_evenement_module.dart';
import 'package:mycs/ui/mov_combat/mov_combat_module.dart';
import 'package:mycs/ui/moving/moving_module.dart';
import 'package:mycs/ui/moving_show/moving_show_module.dart';
import 'package:mycs/ui/planning/planning_module.dart';
import 'package:mycs/ui/step_mov/step_mov_module.dart';
import 'package:mycs/ui/users/add_user_module.dart';
import 'package:mycs/ui/users/login/login_module.dart';
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
      ...getIt<MovCombatModule>().getRoutes(),
      ...getIt<AddUserModule>().getRoutes(),
      ...getIt<LoginModule>().getRoutes(),
      ...getIt<AdminPageModule>().getRoutes(),
      ...getIt<AccountModule>().getRoutes(),
      ...getIt<EvenementPageModule>().getRoutes(),
      ...getIt<PlanningModule>().getRoutes(),
      ...getIt<ContactModule>().getRoutes(),
      ...getIt<AddEvenementModule>().getRoutes(),
      ...getIt<RemoveEvenementModule>().getRoutes()

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