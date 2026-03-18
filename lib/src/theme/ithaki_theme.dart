import 'package:flutter/material.dart';

class IthakiTheme {
  static const primaryPurple = Color(0xFF905CFF);
  static const primaryPurpleLight = Color(0xFFC7ADFF);
  static const backgroundWhite = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1E1E1E);
  static const textSecondary = Color(0xFF6B6B6B);
  static const textHint = Color(0xFFAAAAAA);
  static const borderLight = Color(0xFFD0D0D0);
  static const cardBackground = Color(0xFFF2F2F2);
  static const successGreen = Color(0xFF4CAF50);
  static const errorRed = Color(0xFFC9363E);

  static const headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );

  static const sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const bodyRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  static const labelMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: primaryPurple,
  );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPurple,
          surface: backgroundWhite,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: backgroundWhite,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
      );
}
