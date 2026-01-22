abstract interface class SettingsRepository {
  Future<void> setDarkMode(bool isEnabled);
  Future<bool> isDarkModeEnabled();
}
