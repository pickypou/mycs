
import 'package:flutter/material.dart';

import '../../../core/di/di.dart';
import '../../../data/repository/evenement_repository.dart';
import '../../../domain/entity/evenements.dart';
import '../../../domain/usecase/fetch_evenement_data_usecase.dart';


class EvenementListInteractor {
  final  fetchEvenementDataUseCase = getIt<FetchEvenementDataUseCase>();
  final  evenementsRepository = getIt<EvenementsRepository>();

  EvenementListInteractor(
      );

  Future<Iterable<Evenement>> fetchEvenementData() async {
    try {
      final evenement = await fetchEvenementDataUseCase.getEvenements();
      return evenement;
    } catch (e) {
      debugPrint('Erreur lors de la récupération de l\'événement');
      rethrow;
    }
  }

  Future<Evenement?> getEvenementById(String evenementId) async {
    try {
      return await fetchEvenementDataUseCase.getEvenementById(evenementId);
    } catch (e) {
      debugPrint('Erreur lors de la récupération de l\'événement par ID : $e');
      rethrow;
    }
  }


  Future<void> removeEvenement(String evenementId) async {
    try {
      await evenementsRepository.deleteEvenement(evenementId, );
      debugPrint('Événement supprimé : $evenementId');
    } catch (e) {
      debugPrint('Erreur lors de la suppression de l\'événement : $e');
      rethrow;
    }
  }
}