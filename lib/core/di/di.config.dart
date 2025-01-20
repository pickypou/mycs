// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../ui/moving/moving_module.dart' as _i442;
import '../../ui/moving_show/moving_show_module.dart' as _i529;
import '../../ui/ui_module.dart' as _i573;
import '../../ui/view_all/view_all_module.dart' as _i261;
import '../../ui/zen_moving/zen_moving_module.dart' as _i750;
import '../api/firebase_client.dart' as _i785;
import '../api/firestore_service.dart' as _i551;
import '../api/storage_service.dart' as _i1042;
import '../router/router_config.dart' as _i718;

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
  gh.factory<_i785.FirebaseClient>(() => _i785.FirebaseClient());
  gh.singleton<_i718.AppRouterConfig>(() => _i718.AppRouterConfig());
  gh.singleton<_i573.AppRouter>(() => _i573.AppRouter());
  gh.singleton<_i442.MovingModule>(
      () => _i442.MovingModule(gh<_i573.AppRouter>()));
  gh.singleton<_i529.MovingShowModule>(
      () => _i529.MovingShowModule(gh<_i573.AppRouter>()));
  gh.singleton<_i261.ViewAllModule>(
      () => _i261.ViewAllModule(gh<_i573.AppRouter>()));
  gh.singleton<_i750.ZenMovingModule>(
      () => _i750.ZenMovingModule(gh<_i573.AppRouter>()));
  gh.factory<_i551.FirestoreService>(
      () => _i551.FirestoreService(gh<_i974.FirebaseFirestore>()));
  gh.factory<_i1042.StorageService>(
      () => _i1042.StorageService(gh<_i457.FirebaseStorage>()));
  return getIt;
}
