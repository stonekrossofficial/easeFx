import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFFFFECA3);
  static const Color primary = Colors.black;
  static const Color surface = Colors.white;
  static const Color textMain = Colors.black;
  static const Color textMuted = Color(0xFF666666);
  static const Color cardShadow = Color(0x1A000000);
  
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: const ColorScheme.light(
      primary: primary,
      surface: surface,
      background: background,
      onPrimary: Colors.white,
      onSurface: textMain,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: primary),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: background,
      ),
    ),
    textTheme: GoogleFonts.outfitTextTheme().apply(
      bodyColor: textMain,
      displayColor: textMain,
    ).copyWith(
      displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      displayMedium: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      displaySmall: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      headlineLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      headlineMedium: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      headlineSmall: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
      titleLarge: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: textMain),
    ),
  );
}
