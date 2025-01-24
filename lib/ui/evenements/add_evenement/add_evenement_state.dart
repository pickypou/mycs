import '../../../domain/entity/evenements.dart';

abstract class AddEvenementsState {}

class AddEvenementsSignUpInitialState extends AddEvenementsState {}

class AddEvenementsSignUpLoadingState extends AddEvenementsState {}

class AddEvenementsSignUpSuccessState extends AddEvenementsState {
  final String evenementId;
  AddEvenementsSignUpSuccessState({required this.evenementId});
}
class EvenementLoadedState extends AddEvenementsState {
  final List<Evenement> evenementData;

  EvenementLoadedState({required this.evenementData});
}

// État lorsque les détails d'un événement spécifique sont chargés avec succès
class EvenementDetailLoadedState extends AddEvenementsState {
  final Evenement evenementDetail;

  EvenementDetailLoadedState({required this.evenementDetail});
}

class AddEvenementsSignUpErrorState extends AddEvenementsState {
  final String error;
  AddEvenementsSignUpErrorState({required this.error});
}