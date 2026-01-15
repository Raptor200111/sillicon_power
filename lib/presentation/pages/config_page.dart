import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sillicon_power/presentation/theme/theme_provider.dart';

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
              'Configuration',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme Mode:',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  DropdownButton(
                    value: context.watch<ThemeProvider>().themeMode,
                    items: const [
                      DropdownMenuItem(value: ThemeMode.dark, child: Text("DarkMode") ),
                      DropdownMenuItem(value: ThemeMode.light, child: Text("LightMode") ),
                      DropdownMenuItem(value: ThemeMode.system, child: Text("System") ),
                    ], 
                    onChanged: (ThemeMode? value) {
                      if (value != null) {
                        context.read<ThemeProvider>().setThemeMode(value);
                      }
                    }, 
                  ),
                ],
              ),
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