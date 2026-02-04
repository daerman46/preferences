import 'interfaces/settings_local_datasource.dart';

const String isDarkModeKey = 'isDarkModeKey';

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  SettingsLocalDatasourceImpl();

  @override
  Future<bool> isDarkModeEnabled() {
    // TODO: implement isDarkModeEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setDarkMode(bool isEnabled) {
    // TODO: implement setDarkMode
    throw UnimplementedError();
  }
}
