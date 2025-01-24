import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/evenements/evenement_page/view/evenement_view.dart';
import 'package:mycs/ui/ui_module.dart';

@singleton
class EvenementPageModule implements UIModule {
  final AppRouter _appRouter;

  EvenementPageModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }
  @override
  List<RouteBase> getRoutes()  {
    return [
      GoRoute(
        path: '/evenement',
        builder: (context, state) => const EvenementView(),
      )
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    // Implémentation de la méthode manquante
    return {};
  }
}