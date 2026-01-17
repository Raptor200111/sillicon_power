
import 'package:provider/provider.dart';
import 'package:sillicon_power/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:sillicon_power/presentation/theme/language_provider.dart';
import 'package:sillicon_power/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:sillicon_power/presentation/theme/theme_provider.dart';
import 'presentation/pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/di/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await setupDependencies();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        Provider(
          create: (_) => getIt<PopularTVBloc>(),
          dispose: (_, bloc) => bloc.close(),
        ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    
    return MaterialApp(
      title: 'Sillicon Power Inc.',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage),
      home: const HomePage(title: 'Sillicon Power Inc.'),
    );
  }
}