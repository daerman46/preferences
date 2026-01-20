import 'package:flutter/material.dart';

import '../../domain/use_cases/auth/get_token_use_case.dart';
import '../../domain/use_cases/auth/save_token_use_case.dart';
import '../../domain/use_cases/settings/get_theme_use_case.dart';
import '../../domain/use_cases/settings/save_theme_use_case.dart';

class PreferencesController extends ChangeNotifier {
  PreferencesController({
    required this.getThemeUseCase,
    required this.saveThemeUseCase,
    required this.getTokenUseCase,
    required this.saveTokenUseCase,
  });

  final GetThemeUseCase getThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;
  final GetTokenUseCase getTokenUseCase;
  final SaveTokenUseCase saveTokenUseCase;
}
