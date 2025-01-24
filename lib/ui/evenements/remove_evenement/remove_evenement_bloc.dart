
import 'package:flutter_bloc/flutter_bloc.dart';

import 'remove_evenement_event.dart';
import 'remove_evenement_interactor.dart';
import 'remove_evenement_state.dart';

class RemoveEvenementBloc extends Bloc<RemoveEvenementEvent, RemoveEvenementState> {
  final EvenementListInteractor evenementListInteractor;
  final String evenementId;

  RemoveEvenementBloc(this.evenementListInteractor, {required this.evenementId})
      : super(EvenementsListSignUpLoadingState());

  Stream<RemoveEvenementState> mapEventToState(RemoveEvenementEvent event) async* {
    if (event is LoadEvenementList) {
      yield EvenementsListSignUpLoadingState();
      try {
        final evenement = await evenementListInteractor.fetchEvenementData();

        // Convertir l'itérable en une liste
        final evenementList = evenement.toList();

        yield EvenementsListSignUpLoadState(evenementData: evenementList);
      } catch (e) {
        yield EvenementsListSignUpErrorState(
            error: 'Une erreur s\'est produite : $e');
      }
    }
  }
}
