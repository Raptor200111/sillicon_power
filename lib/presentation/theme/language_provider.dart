import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LanguageProvider() {
    loadLanguage();
  }

  void setLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
  }

  void loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('language');

    if (code != null) {
      _locale = Locale(code);
      notifyListeners();
    }
  }
}
