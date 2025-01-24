import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../data/repository/evenement_repository_impl.dart';
import '../entity/evenements.dart';


@injectable
class FetchEvenementDataUseCase {
  final EvenementsRepositoryImpl evenementsRepository;

  FetchEvenementDataUseCase(this.evenementsRepository);

  /// Méthode pour récupérer tous les événements
  Future<List<Evenement>> getEvenements() async {
    try {
      debugPrint("Fetching evenement data from Firestore...");

      // Écoute du stream pour récupérer tous les événements
      final evenementStream = evenementsRepository.getEvenementStream();

      // Liste pour stocker les événements récupérés
      List<Evenement> evenementList = [];
      await for (var evenementIterable in evenementStream) {
        evenementList.addAll(evenementIterable);
      }

      return evenementList;
    } catch (e) {
      debugPrint("Error fetching evenement data: $e");
      rethrow;
    }
  }

  /// Méthode pour récupérer un événement spécifique par son ID
  Future<Evenement?> getEvenementById(String evenementId) async {
    try {
      debugPrint("Fetching evenement by ID: $evenementId");

      // Récupération des données de l'événement à partir du repository
      final evenementDto = await evenementsRepository.getById(evenementId);

      if (evenementDto != null) {
        // Conversion du DTO en entité `Evenement`
        return Evenement(
          id: evenementId,
          title: evenementDto.title,
          fileUrl: evenementDto.fileUrl,
          fileType: evenementDto.fileType,
          publishDate: evenementDto.publishDate,
        );
      } else {
        debugPrint("No data found for evenementId: $evenementId");
        return null;
      }
    } catch (e) {
      debugPrint("Error fetching evenement by ID: $e");
      rethrow;
    }
  }
}
