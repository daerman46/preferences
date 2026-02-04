import 'package:flutter/material.dart';

import '../../domain/use_cases/auth/get_token_use_case.dart';
import '../../domain/use_cases/auth/save_token_use_case.dart';
import '../../domain/use_cases/settings/is_dark_mode_enabled_use_case.dart';
import '../../domain/use_cases/settings/set_dark_mode_use_case.dart';

class PreferencesController extends ChangeNotifier {
  PreferencesController({
    required this.isDarkModeEnabledUseCase,
    required this.setDarkModeUseCase,
    required this.getTokenUseCase,
    required this.saveTokenUseCase,
  });

  final IsDarkModeEnabledUseCase isDarkModeEnabledUseCase;
  final SetDarkModeUseCase setDarkModeUseCase;
  final GetTokenUseCase getTokenUseCase;
  final SaveTokenUseCase saveTokenUseCase;

  bool _isDarkMode = false;
  bool _isLoading = false;

  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;

  void loadPreferences() async {
    _isLoading = true;
    notifyListeners();

    // TODO(): Add call to get dark mode preference

    _isLoading = false;
    notifyListeners();
  }

  void toggleDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    notifyListeners();

    // TODO(): Add call to save dark mode preference
  }
}
