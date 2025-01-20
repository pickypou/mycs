import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/step_mov/step_mov.dart';
import 'package:mycs/ui/ui_module.dart';


@singleton
class StepMovModule implements UIModule {
  final AppRouter _appRouter;

  StepMovModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }
  @override
  List<RouteBase> getRoutes()  {
    return [
      GoRoute(
        path: '/step_mov',
        builder: (context, state) => const StepMov(),
      )
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    // Implémentation de la méthode manquante
    return {};
  }
}