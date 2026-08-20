import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Color Palette matching Truck-View Web
  static const Color primaryOrange = Color(0xFFFF7A00);
  static const Color darkBackground = Color(0xFF0B0F19);
  static const Color surfaceCard = Color(0xFF1F2937);
  static const Color surfaceCardBorder = Color(0xFF374151);
  static const Color textWhite = Color(0xFFF9FAFB);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color errorRed = Color(0xFFEF4444);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primaryOrange,
      colorScheme: const ColorScheme.dark(
        primary: primaryOrange,
        surface: surfaceCard,
        background: darkBackground,
        error: errorRed,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        headlineSmall: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.w600),
        titleSmall: GoogleFonts.poppins(color: textWhite, fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.poppins(color: textWhite),
        bodyMedium: GoogleFonts.poppins(color: textMuted),
        bodySmall: GoogleFonts.poppins(color: textMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceCard,
        hintStyle: GoogleFonts.poppins(color: textMuted, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: surfaceCardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: surfaceCardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryOrange, width: 2),
        ),
      ),
    );
  }
}