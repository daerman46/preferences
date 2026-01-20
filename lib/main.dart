import 'package:flutter/material.dart';
import 'package:preferences/core/di/dependency_injection.dart';
import 'package:preferences/presentation/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(const HomePage());
}
