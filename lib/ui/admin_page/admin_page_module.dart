import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:mycs/ui/admin_page/admin_page.dart';

import '../ui_module.dart';

@singleton
class AdminPageModule implements UIModule {
  final AppRouter _appRouter;
  AdminPageModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }
  @override
  List<RouteBase> getRoutes()  {
    return [
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminPage(),
      )
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    // Implémentation de la méthode manquante
    return {};
  }
}