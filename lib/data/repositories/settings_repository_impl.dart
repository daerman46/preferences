import 'package:preferences/data/datasources/interfaces/settings_local_datasource.dart';

import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.settingsLocalDatasource});

  final SettingsLocalDatasource settingsLocalDatasource;

  @override
  Future<bool> isDarkModeEnabled() => settingsLocalDatasource.isDarkModeEnabled();

  @override
  Future<void> setDarkMode(bool isEnabled) =>
      settingsLocalDatasource.setDarkMode(isEnabled);
}
