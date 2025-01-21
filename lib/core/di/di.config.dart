// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repository/evenement-repository_impl.dart' as _i720;
import '../../data/repository/evenement_repository.dart' as _i590;
import '../../data/repository/users_repository.dart' as _i151;
import '../../data/repository/users_repository_impl.dart' as _i304;
import '../../domain/usecase/fetch_evenement_data_usecase.dart' as _i1046;
import '../../domain/usecase/fetch_user_data_usecase.dart' as _i487;
import '../../domain/usecase/generate_and_upload_thumbnail_use_case.dart'
    as _i122;
import '../../ui/admin_page/admin_page_module.dart' as _i727;
import '../../ui/mov_combat/mov_combat_module.dart' as _i1009;
import '../../ui/moving/moving_module.dart' as _i442;
import '../../ui/moving_show/moving_show_module.dart' as _i529;
import '../../ui/step_mov/step_mov_module.dart' as _i640;
import '../../ui/ui_module.dart' as _i573;
import '../../ui/users/add_user_module.dart' as _i753;
import '../../ui/users/login/login_module.dart' as _i863;
import '../../ui/view_all/view_all_module.dart' as _i261;
import '../../ui/zen_moving/zen_moving_module.dart' as _i750;
import '../api/auth_service.dart' as _i893;
import '../api/firebase_client.dart' as _i785;
import '../api/firestore_service.dart' as _i551;
import '../api/storage_service.dart';
import '../router/router_config.dart' as _i718;
import 'di_module.dart' as _i211;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i785.FirebaseClient>(() => _i785.FirebaseClient());
  gh.factory<_i122.GenerateThumbnailUseCase>(
      () => _i122.GenerateThumbnailUseCase());
  gh.singleton<_i718.AppRouterConfig>(() => _i718.AppRouterConfig());
  gh.singleton<_i573.AppRouter>(() => _i573.AppRouter());
  gh.lazySingleton<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
  gh.lazySingleton<_i457.FirebaseStorage>(() => appModule.firebaseStorage);
  gh.lazySingleton<_i974.FirebaseFirestore>(() => appModule.firebaseFirestore);
  gh.singleton<_i727.AdminPageModule>(
      () => _i727.AdminPageModule(gh<_i573.AppRouter>()));
  gh.singleton<_i442.MovingModule>(
      () => _i442.MovingModule(gh<_i573.AppRouter>()));
  gh.singleton<_i529.MovingShowModule>(
      () => _i529.MovingShowModule(gh<_i573.AppRouter>()));
  gh.singleton<_i1009.MovCombatModule>(
      () => _i1009.MovCombatModule(gh<_i573.AppRouter>()));
  gh.singleton<_i640.StepMovModule>(
      () => _i640.StepMovModule(gh<_i573.AppRouter>()));
  gh.singleton<_i753.AddUserModule>(
      () => _i753.AddUserModule(gh<_i573.AppRouter>()));
  gh.singleton<_i863.LoginModule>(
      () => _i863.LoginModule(gh<_i573.AppRouter>()));
  gh.singleton<_i261.ViewAllModule>(
      () => _i261.ViewAllModule(gh<_i573.AppRouter>()));
  gh.singleton<_i750.ZenMovingModule>(
      () => _i750.ZenMovingModule(gh<_i573.AppRouter>()));
  gh.factory<_i151.UsersRepository>(() => _i304.UsersRepositoryImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ));
  gh.singleton<_i893.AuthService>(
      () => _i893.AuthService(gh<_i59.FirebaseAuth>()));
  gh.factory<_i551.FirestoreService>(
      () => _i551.FirestoreService(gh<_i974.FirebaseFirestore>()));
  gh.factory<_i487.FetchUserDataUseCase>(() => _i487.FetchUserDataUseCase(
        gh<String>(),
        gh<_i304.UsersRepositoryImpl>(),
      ));
  gh.factory<StorageService>(() => StorageService(gh<_i457.FirebaseStorage>()));
  gh.factory<_i590.EvenementsRepository>(() => _i720.EvenementsRepositoryImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i457.FirebaseStorage>(),
      ));
  gh.factory<_i1046.FetchEvenementDataUseCase>(() =>
      _i1046.FetchEvenementDataUseCase(gh<_i720.EvenementsRepositoryImpl>()));
  return getIt;
}

class _$AppModule extends _i211.AppModule {}
