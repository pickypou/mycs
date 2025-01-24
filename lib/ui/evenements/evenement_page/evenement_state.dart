
import '../../../domain/entity/evenements.dart';

abstract class EvenementState {}

// État pour le chargement
class EvenementLoadingState extends EvenementState {}

// État lorsque la liste des événements est chargée avec succès
class EvenementLoadedState extends EvenementState {
  final List<Evenement> evenementData;

  EvenementLoadedState({required this.evenementData});
}

// État lorsque les détails d'un événement spécifique sont chargés avec succès
class EvenementDetailLoadedState extends EvenementState {
  final Evenement evenementDetail;

  EvenementDetailLoadedState({required this.evenementDetail});
}

// État en cas d'erreur
class EvenementErrorState extends EvenementState {
  final String message;

  EvenementErrorState({required this.message});
}