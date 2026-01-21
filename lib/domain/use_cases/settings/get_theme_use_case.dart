import '../../repositories/settings_repository.dart';

class GetThemeUseCase {
  GetThemeUseCase({required this.settingsRepository});

  final SettingsRepository settingsRepository;

  Future<bool> call() async => await settingsRepository.getTheme();
}
