import 'package:flutter/material.dart';
import 'package:sillicon_power/presentation/theme/theme.dart';
import 'presentation/pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/di/service_locator.dart';

Future<void> main() async {
  await dotenv.load();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sillicon Power Inc.',
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      //themeMode: ThemeMode.system,
      home: const HomePage(title: 'Sillicon Power Inc.'),
    );
  }
}
