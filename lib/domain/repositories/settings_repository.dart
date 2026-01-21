abstract interface class SettingsRepository {
  Future<void> saveTheme(bool isDarkMode);
  Future<bool> getTheme();
}
