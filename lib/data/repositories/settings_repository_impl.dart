import 'package:preferences/data/datasources/interfaces/settings_local_datasource.dart';

import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.settingsLocalDatasource});

  final SettingsLocalDatasource settingsLocalDatasource;

  @override
  Future<bool> getTheme() => settingsLocalDatasource.getTheme();

  @override
  Future<void> saveTheme(bool isDarkMode) =>
      settingsLocalDatasource.saveTheme(isDarkMode);
}
