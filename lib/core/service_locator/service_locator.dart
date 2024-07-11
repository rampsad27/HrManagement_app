import 'package:get_it/get_it.dart';
import 'package:HrManagement/core/configs/initializer/init_bloc.dart';
import 'package:HrManagement/core/configs/initializer/init_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());
  InitRepository.init();
  InitBloc.init();
}
