import 'package:equatable/equatable.dart';

abstract class RemoveEvenementEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadEvenementList extends RemoveEvenementEvent {}

class FetchComFetchEvenementListDetail extends RemoveEvenementEvent {
  final String evenementId;

  FetchComFetchEvenementListDetail(this.evenementId);

  @override
  List<Object> get props => [evenementId];
}