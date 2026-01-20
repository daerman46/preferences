import 'package:flutter/material.dart';
import 'package:preferences/core/di/dependency_injection.dart';
import 'package:preferences/presentation/controllers/preferences_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = 'Preferences Demo';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => serviceLocator<PreferencesController>(),
        ),
      ],
      child: Consumer<PreferencesController>(
        builder: (_, __, ___) {
          return MaterialApp(
            title: title,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: _HomePage(title: title),
          );
        },
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(child: Text(title)),
    );
  }
}
