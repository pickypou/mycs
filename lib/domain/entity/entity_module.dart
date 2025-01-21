import 'package:get_it/get_it.dart';
import 'package:mycs/domain/entity/user.dart';

import 'evenements.dart';

final GetIt getIt = GetIt.instance;

void setupEntityModule() {
  //Register evenements
  getIt.registerFactory<Evenement>(() => Evenement(
        id: '',
        title: '',
        fileType: '',
        fileUrl: '',
        publishDate: DateTime.now(),
      ));

  //Register Users
  getIt.registerFactory<Users>(
      () => Users(id: '', userName: '', email: '', password: ''));
}
