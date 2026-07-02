import 'package:flutter/material.dart';

class ThemeManager {
  // Colors
  static const Color primaryTeal = Color(0xFF00B4D8);
  static const Color deepNavyBlue = Color(0xFF0A192F);
  static const Color navyLight = Color(0xFF112240);
  static const Color crispWhite = Color(0xFFE6F1FF);
  static const Color textSlate = Color(0xFF8892B0);
  static const Color textLight = Color(0xFFCCD6F6);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      colorScheme: const ColorScheme.light(
        primary: primaryTeal,
        secondary: deepNavyBlue,
        surface: Colors.white,
      ),
      fontFamily: 'Poppins',
      textTheme: _buildTextTheme(Brightness.light),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: deepNavyBlue,
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: deepNavyBlue,
      colorScheme: const ColorScheme.dark(
        primary: primaryTeal,
        secondary: primaryTeal,
        surface: navyLight,
      ),
      fontFamily: 'Poppins',
      textTheme: _buildTextTheme(Brightness.dark),
      appBarTheme: const AppBarTheme(
        backgroundColor: deepNavyBlue,
        foregroundColor: crispWhite,
        elevation: 0,
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final Color textColor = brightness == Brightness.dark ? crispWhite : deepNavyBlue;
    final Color subtitleColor = brightness == Brightness.dark ? textSlate : Colors.grey[700]!;

    return TextTheme(
      displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, color: textColor),
      displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: textColor),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: textColor),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textColor),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textColor),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: subtitleColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: subtitleColor),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
    );
  }
}
