import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class AddEvenementEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Événement pour charger tous les événements
class LoadAEvenementEvent extends AddEvenementEvent {}

// Événement pour récupérer les détails d'un événement spécifique
class FetchEvenementDetailEvent extends AddEvenementEvent {
  final String evenementId;

  FetchEvenementDetailEvent(this.evenementId);

  @override
  List<Object> get props => [evenementId];
}

class EvenementSignUpEvent extends AddEvenementEvent {
  final String id;
  final String title;
  final String fileType;
  final DateTime publishDate;
  final File file;
  final Uint8List? thumbnail;

  EvenementSignUpEvent({
    required this.id,
    required this.title,
    required this.fileType,
    required this.publishDate,
    required this.file,
    this.thumbnail,
  });
}