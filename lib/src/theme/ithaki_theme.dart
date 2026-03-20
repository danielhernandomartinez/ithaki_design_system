import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IthakiTheme {
  static const primaryPurple = Color(0xFF905CFF);
  static const primaryPurpleLight = Color(0xFFC7ADFF);
  static const backgroundWhite = Color(0xFFFFFFFF);
  static const backgroundViolet = Color(0xFFF6F2FE);
  static const chipActive = Color(0xFFE9DEFF);
  static const textPrimary = Color(0xFF1E1E1E);
  static const textSecondary = Color(0xFF6B6B6B);
  static const lightGraphite = Color(0xFFA5A5A5);
  static const lightGray = Color(0xFFD2D2D2);
  static const softGray = Color(0xFFF2F2F2);
  static const wireframeDark = Color(0xFF464D56);
  static const softGraphite = Color(0xFF787878);
  static const borderLight = Color(0xFFD0D0D0);
  static const cardBackground = Color(0xFFF2F2F2);
  static const graphite = Color(0x1A4B4B4B);
  static const successGreen = Color(0xFF4CAF50);
  static const errorRed = Color(0xFFC9363E);

  // 24px — main titles
  static const headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );

  // 20px — screen subtitles
  static const headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  // 16px — body / descriptive text
  static const bodyRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textPrimary,
  );

  // 16px — field labels
  static const labelField = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  // 16px — input and dropdown hints
  static const hintStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: softGraphite,
  );

  static const sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const labelMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryPurple,
  );

  // 16px — body text secondary color
  static const bodySecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  // 16px — button labels
  static const buttonLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // 14px — small body text
  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimary,
  );

  // 14px — small body medium weight
  static const bodySmallMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  // 14px — small body semi-bold
  static const bodySmallSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  // 14px — small body bold
  static const bodySmallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );

  // 14px — small hint text
  static const hintSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: softGraphite,
  );

  // 14px — link with underline
  static const linkSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimary,
    decoration: TextDecoration.underline,
    decorationColor: textPrimary,
  );

  // 14px — field labels
  static const fieldLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  // 14px — chip labels
  static const chipLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  // 14px — caption text
  static const captionRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  // 14px — caption with line height
  static const captionDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textSecondary,
    height: 1.4,
  );

  // 14px — error text
  static const errorCaption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: errorRed,
  );

  // 18px — app bar title
  static const appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  // 16px — badge labels
  static const badgeLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF),
  );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        textTheme: GoogleFonts.notoSansTextTheme(),
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
          titleTextStyle: appBarTitle,
        ),
      );
}
