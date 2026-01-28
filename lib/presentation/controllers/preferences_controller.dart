import 'package:flutter/material.dart';
import 'package:preferences/domain/use_cases/auth/delete_token_use_case.dart';

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
    required this.deleteTokenUseCase,
  });

  final IsDarkModeEnabledUseCase isDarkModeEnabledUseCase;
  final SetDarkModeUseCase setDarkModeUseCase;
  final GetTokenUseCase getTokenUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final DeleteTokenUseCase deleteTokenUseCase;

  bool _isDarkMode = false;
  bool _isLoading = false;

  String? _token;

  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;

  String? get token => _token;
  bool get isAuthenticated => _token != null && _token!.isNotEmpty;


  void loadPreferences() async {
    _isLoading = true;
    notifyListeners();

    _isDarkMode = await isDarkModeEnabledUseCase();
    _isLoading = false;
    notifyListeners();
  }

  void toggleDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    notifyListeners();

    await setDarkModeUseCase(isDarkMode);
  }


  void loadToken() async {
    _isLoading = true;
    notifyListeners();

    _token = await getTokenUseCase();
    _isLoading = false;
    notifyListeners();
  }

  void saveToken(String token) async {
    _isLoading = true;
    notifyListeners();

    await saveTokenUseCase(token);
    _token = token;

    _isLoading = false;
    notifyListeners();
  }

  void deleteToken() async {
    _isLoading = true;
    notifyListeners();

    await deleteTokenUseCase();
    _token = null;

    _isLoading = false;
    notifyListeners();
  }


}
