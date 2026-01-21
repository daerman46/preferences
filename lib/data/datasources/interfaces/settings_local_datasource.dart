abstract interface class SettingsLocalDatasource {
  Future<void> saveTheme(bool isDarkMode);
  Future<bool> getTheme();
}
