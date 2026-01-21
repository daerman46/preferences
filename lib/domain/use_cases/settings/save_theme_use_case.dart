import '../../repositories/settings_repository.dart';

class SaveThemeUseCase {
  SaveThemeUseCase({required this.settingsRepository});

  final SettingsRepository settingsRepository;

  Future<void> call(bool isDarkMode) async =>
      await settingsRepository.saveTheme(isDarkMode);
}
