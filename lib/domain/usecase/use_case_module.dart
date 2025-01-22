
import 'package:get_it/get_it.dart';

import '../../data/repository/evenement_repository_impl.dart';
import '../../data/repository/users_repository_impl.dart';
import 'fetch_evenement_data_usecase.dart';
import 'fetch_user_data_usecase.dart';
import 'generate_and_upload_thumbnail_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupUseCaseModule() {


  // Enregistrement du cas d'utilisation FetchEvenementDataUseCase
  getIt.registerLazySingleton<FetchEvenementDataUseCase>(
          () => FetchEvenementDataUseCase(getIt<EvenementsRepositoryImpl>())
  );
  getIt.registerLazySingleton<GenerateThumbnailUseCase>(() as FactoryFunc<GenerateThumbnailUseCase>);


  // Enregistrement du cas d'utilisation FetchUserDataUseCase avec un userId dynamique
  getIt.registerFactoryParam<FetchUserDataUseCase, String, void>(
          (userId, _) => FetchUserDataUseCase(userId, getIt<UsersRepositoryImpl>())
  );
}