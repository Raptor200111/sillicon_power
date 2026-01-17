
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    loadTheme();
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', mode.name);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = prefs.getString('themeMode');

    if (storedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere((e) => e.name == storedTheme);
      notifyListeners();
    }
  }
}
