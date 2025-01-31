
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:mycs/data/repository/users_repository.dart';
import 'package:mycs/data/repository/users_repository_impl.dart';

import '../../core/api/firestore_service.dart';
import '../../core/di/di.dart';
import '../../domain/usecase/fetch_evenement_data_usecase.dart';
import '../../ui/evenements/add_evenement/add_evenements_interactor.dart';
import 'evenement_repository_impl.dart';
import 'evenement_repository.dart';

void setupDataModule() {
  if (!GetIt.I.isRegistered<FirebaseFirestore>()) {
    GetIt.I.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  }
  if (!GetIt.I.isRegistered<FirestoreService>()) {
    GetIt.I.registerLazySingleton<FirestoreService>(() => getIt<FirestoreService>());
  }

  getIt.registerLazySingleton<EvenementsRepository>(
          () => EvenementsRepositoryImpl());



  getIt.registerLazySingleton<UsersRepository>(() =>
      UsersRepositoryImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()));

  getIt.registerLazySingleton<EvenementsInteractor>(
          () => EvenementsInteractor(getIt<FetchEvenementDataUseCase>(), evenementsRepositoryImpl: getIt<EvenementsRepositoryImpl>())
  );


}