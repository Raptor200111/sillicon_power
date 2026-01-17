import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'en';
  
  String get currentLanguage => _currentLanguage;
  
  /// Change the language and notify listeners
  void setLanguage(String language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }
  
  /// Get the language code (e.g., 'en', 'es')
  String getLanguageCode() => _currentLanguage;
  
  /// Check if Spanish is selected
  bool get isSpanish => _currentLanguage == 'es';
  
  /// Check if English is selected
  bool get isEnglish => _currentLanguage == 'en';
}