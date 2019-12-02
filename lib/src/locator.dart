/// [Third Part Packages]
import 'package:get_it/get_it.dart';

/// [Tyba Packages]
import 'package:tyba_front_test/src/core/data/models/index.dart';
import 'package:tyba_front_test/src/core/services/index.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => ProfileModel());
  locator.registerFactory(() => SearchModel());
  locator.registerFactory(() => Api());
}
