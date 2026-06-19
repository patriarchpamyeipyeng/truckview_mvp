import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF0A1F44);
  static const Color accentOrange = Color(0xFFFF7A00);
  static const Color background = Color(0xFFF8F9FA);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: background,
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );
}