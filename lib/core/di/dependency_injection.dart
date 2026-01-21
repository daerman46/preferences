import 'package:get_it/get_it.dart';
import 'package:preferences/presentation/controllers/preferences_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/auth_local_datasource_impl.dart';
import '../../data/datasources/interfaces/auth_local_datasource.dart';
import '../../data/datasources/interfaces/settings_local_datasource.dart';
import '../../data/datasources/settings_local_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/use_cases/auth/get_token_use_case.dart';
import '../../domain/use_cases/auth/save_token_use_case.dart';
import '../../domain/use_cases/settings/get_theme_use_case.dart';
import '../../domain/use_cases/settings/save_theme_use_case.dart';

final serviceLocator = GetIt.instance;

Future<void> injectDependency() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton<SettingsLocalDatasource>(
    () => SettingsLocalDatasourceImpl(sharedPreferences: sharedPreferences),
  );
  serviceLocator.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(),
  );

  serviceLocator.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(settingsLocalDatasource: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authLocalDatasource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => GetThemeUseCase(settingsRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveThemeUseCase(settingsRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetTokenUseCase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveTokenUseCase(authRepository: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => PreferencesController(
      getThemeUseCase: serviceLocator(),
      saveThemeUseCase: serviceLocator(),
      getTokenUseCase: serviceLocator(),
      saveTokenUseCase: serviceLocator(),
    ),
  );
}
