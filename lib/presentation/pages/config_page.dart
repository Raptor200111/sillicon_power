import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sillicon_power/presentation/theme/language_provider.dart';
import 'package:sillicon_power/presentation/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.inversePrimary),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,
            title: Text(
              AppLocalizations.of(context)!.configuration,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.themeMode}:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    DropdownButton(
                      value: context.watch<ThemeProvider>().themeMode,
                      items: const [
                        DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark") ),
                        DropdownMenuItem(value: ThemeMode.light, child: Text("Light") ),
                        DropdownMenuItem(value: ThemeMode.system, child: Text("System") ),
                      ], 
                      onChanged: (ThemeMode? value) {
                        if (value != null) {
                          context.read<ThemeProvider>().setThemeMode(value);
                        }
                      }, 
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.language}:',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 16),
                        DropdownButton<Locale>(
                          value: context.watch<LanguageProvider>().locale,
                          items: const [
                            DropdownMenuItem(value: Locale('en'), child: Text("English")),
                            DropdownMenuItem(value: Locale('es'), child: Text("Español")),
                          ],
                          onChanged: (Locale? value) {
                            if (value != null) {
                              context.read<LanguageProvider>().setLanguage(value);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                ],
              )
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
          ),
        ],
      )
    );
  }
}