import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color surfaceActive = Color(0xFF2C2C2C);
  
  // Semantic Accents
  static const Color focusBlue = Color(0xFF4A90E2);
  static const Color commuteOrange = Color(0xFFF5A623);
  static const Color personalTeal = Color(0xFF50E3C2);
  static const Color errorRed = Color(0xFFFF5252);
  static const Color successGreen = Color(0xFF7ED321);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: focusBlue,
        secondary: personalTeal,
        surface: surface,
        error: errorRed,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
      cardTheme: const CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: focusBlue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
