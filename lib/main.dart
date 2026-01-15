import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sillicon_power/presentation/theme/theme.dart';
import 'package:sillicon_power/presentation/theme/theme_provider.dart';
import 'presentation/pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/di/service_locator.dart';

Future<void> main() async {
  await dotenv.load();
  setupDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sillicon Power Inc.',
      //theme: Provider.of<ThemeProvider>(context).themeData,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      home: const HomePage(title: 'Sillicon Power Inc.'),
    );
  }
}
