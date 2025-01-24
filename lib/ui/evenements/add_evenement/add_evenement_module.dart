import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/evenements/add_evenement/view/add_evenements_view.dart';

import '../../ui_module.dart';
import 'add_evenement_bloc.dart';

@singleton
class AddEvenementModule implements UIModule {
  final AppRouter _appRouter;

  AddEvenementModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }

  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: '/evenement',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: _buildEvenementPage(),
          );
        },
      ),
    ];
  }

  Widget _buildEvenementPage() {
    return BlocProvider<AddEvenementsBloc>(
      create: (context) {
        return AddEvenementsBloc();
      },
      child: AddEvenementView(),
    );
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    return {};
  }
}
