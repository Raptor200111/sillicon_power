import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey[100]!,
      primary: Colors.grey[200]!,
      secondary: Colors.grey[300]!,
      inversePrimary: Colors.grey[600]!,
      tertiary: Colors.orange,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black45, fontSize: 14),
      bodySmall: TextStyle(color: Colors.black38, fontSize: 12),
      titleLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey[900]!,
      primary: Colors.grey[800]!,
      secondary: Colors.grey[700]!,
      inversePrimary: Colors.grey[400]!,
      tertiary: Colors.yellow,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white54, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white38, fontSize: 12),
      titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}