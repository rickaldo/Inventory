import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/firestorage_service.dart';
import 'package:ShishaOase/services/firestore_service.dart';
import 'package:ShishaOase/services/imagepicker_service.dart';
import 'package:ShishaOase/ui/views/drinklist/drink_viewmodel.dart';
import 'package:ShishaOase/ui/views/home/home_viewmodel.dart';
import 'package:ShishaOase/ui/views/tabakliste/tabak_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/navigation_service.dart' as nav;

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => nav.NavigationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerSingletonAsync(() async {
    print("locator");
    AppService ap = await AppService().initStream();
    return ap;
  });
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => FireStorageService());
  locator.registerLazySingleton(() => ImagePickerService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => TabakViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => DrinkViewModel());
}
