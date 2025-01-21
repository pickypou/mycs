

import 'package:mycs/domain/usecase/use_case_module.dart';

import 'entity/entity_module.dart';

void setupDomainModule() {
  // Setup des entités
  setupEntityModule();

  //Setupt des Use Case

  setupUseCaseModule();
}