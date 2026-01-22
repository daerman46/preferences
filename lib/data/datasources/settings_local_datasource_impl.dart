import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/settings_local_datasource.dart';

const String isDarkModeKey = 'isDarkMode';

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  SettingsLocalDatasourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> isDarkModeEnabled() async =>
      sharedPreferences.getBool(isDarkModeKey) ?? false;

  @override
  Future<void> setDarkMode(bool isEnabled) async =>
      await sharedPreferences.setBool(isDarkModeKey, isEnabled);
}
