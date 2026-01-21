import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/settings_local_datasource.dart';

const String isDarkModeKey = 'isDarkMode';

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  SettingsLocalDatasourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> getTheme() async =>
      sharedPreferences.getBool(isDarkModeKey) ?? false;

  @override
  Future<void> saveTheme(bool isDarkMode) async =>
      await sharedPreferences.setBool(isDarkModeKey, isDarkMode);
}
