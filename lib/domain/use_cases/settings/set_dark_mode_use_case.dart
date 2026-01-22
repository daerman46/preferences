import '../../repositories/settings_repository.dart';

class SetDarkModeUseCase {
  SetDarkModeUseCase({required this.settingsRepository});

  final SettingsRepository settingsRepository;

  Future<void> call(bool isEnabled) async =>
      await settingsRepository.setDarkMode(isEnabled);
}
