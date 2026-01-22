import '../../repositories/settings_repository.dart';

class IsDarkModeEnabledUseCase {
  IsDarkModeEnabledUseCase({required this.settingsRepository});

  final SettingsRepository settingsRepository;

  Future<bool> call() async => await settingsRepository.isDarkModeEnabled();
}
