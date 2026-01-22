abstract interface class SettingsLocalDatasource {
  Future<void> setDarkMode(bool isEnabled);
  Future<bool> isDarkModeEnabled();
}
