
import '../../../domain/entity/evenements.dart';

abstract class RemoveEvenementState {}

class EvenementsListSignUpInitialState extends RemoveEvenementState {}

class EvenementsListSignUpLoadingState extends RemoveEvenementState {}

class EvenementsListSignUpLoadState extends RemoveEvenementState {
  final List<Evenement> evenementData;
  EvenementsListSignUpLoadState({required this.evenementData});
}

class EvenementsListSignUpSuccessState extends RemoveEvenementState {
  final String evenementId;
  EvenementsListSignUpSuccessState({required this.evenementId});
}

class EvenementsListSignUpErrorState extends RemoveEvenementState {
  final String error;
  EvenementsListSignUpErrorState({required this.error});
}