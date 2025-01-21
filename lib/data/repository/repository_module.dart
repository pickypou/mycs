
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mycs/data/repository/users_repository.dart';
import 'package:mycs/data/repository/users_repository_impl.dart';

import '../../core/api/firestore_service.dart';
import '../../core/di/di.dart';
import 'evenement-repository_impl.dart';
import 'evenement_repository.dart';

void setupDataModule() {
  getIt.registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance);

  // Pass the FirebaseFirestore instance to the FirestoreService
  getIt.registerLazySingleton<FirestoreService>(
          () => FirestoreService(getIt<FirebaseFirestore>()));


  getIt.registerLazySingleton<EvenementsRepository>(() =>
      EvenementsRepositoryImpl(
          getIt<FirebaseFirestore>(), getIt<FirebaseStorage>()));

  getIt.registerLazySingleton<UsersRepository>(() =>
      UsersRepositoryImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()));
}