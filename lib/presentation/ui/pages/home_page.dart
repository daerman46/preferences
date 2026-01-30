import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/di/dependency_injection.dart';
import '../../controllers/preferences_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = 'Preferences Demo';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => serviceLocator<PreferencesController>()
            ..loadPreferences()
            ..loadToken(),
        ),
      ],
      child: Consumer<PreferencesController>(
        builder: (_, preferencesController, __) {
          return MaterialApp(
            title: title,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: preferencesController.isDarkMode
                    ? Brightness.dark
                    : Brightness.light,
              ),
              useMaterial3: true,
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
    final preferencesController = context.watch<PreferencesController>();
    final isDarkMode = preferencesController.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              Switch(
                value: isDarkMode,
                onChanged: preferencesController.toggleDarkMode,
              ),
            ],
          ),
          if (preferencesController.isAuthenticated)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: preferencesController.deleteToken,
            ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: preferencesController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : preferencesController.isAuthenticated
          ? Center(
              child: Text(
                'Authenticated with token:\n${preferencesController.token}',
                textAlign: TextAlign.center,
              ),
            )
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  preferencesController.saveToken('sample_token_12345');
                },
                child: const Text('Login'),
              ),
            ),
    );
  }
}
