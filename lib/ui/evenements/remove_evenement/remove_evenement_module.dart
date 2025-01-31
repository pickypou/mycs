
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mycs/ui/evenements/remove_evenement/view/remove_evenement_view.dart';

import '../../../core/di/di.dart';
import '../../../data/repository/evenement_repository_impl.dart';
import '../../../domain/usecase/fetch_evenement_data_usecase.dart';
import '../../ui_module.dart';
import 'remove_evenement_bloc.dart';
import 'remove_evenement_interactor.dart';



@singleton
class RemoveEvenementModule implements UIModule {
  final AppRouter _appRouter;

  RemoveEvenementModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }

  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
          path: '/evenementList',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: _buildEvenementList(),
            );
          })
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    return {};
  }

  Widget _buildEvenementList() {
    return BlocProvider<RemoveEvenementBloc>(
      create: (context) {
        EvenementsRepositoryImpl evenementsRepository =
        getIt<EvenementsRepositoryImpl>();
        FetchEvenementDataUseCase fetchEvenementDataUseCase =
        getIt<FetchEvenementDataUseCase>();
        final String evenementId = '';
        var interactor = EvenementListInteractor(getIt<FetchEvenementDataUseCase>(), getIt<EvenementsRepositoryImpl>());


        return RemoveEvenementBloc(interactor, evenementId: evenementId);
      },
      child: RemoveEvenementView(),
    );
  }
}