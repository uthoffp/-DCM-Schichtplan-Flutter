import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DcmTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    Color? primary = Colors.red[500];
    Color? primaryDark = Colors.red[700];
    Color? primaryAccent = Colors.red[100];

    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: primaryDark,
          titleTextStyle: darkTextTheme.headline6,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: lightTextTheme,
        colorScheme: ColorScheme(
            primary: primary!,
            primaryVariant: primaryAccent!,
            onPrimary: Colors.white,
            background: Colors.white,
            brightness: Brightness.light,
            error: Colors.red,
            onBackground: Colors.black87,
            onError: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black87,
            secondary: primary,
            secondaryVariant: primaryAccent,
            surface: Colors.white));
  }

  static ThemeData dark() {
    Color? primary = Colors.red[500];
    Color? primaryDark = Colors.red[700];
    Color? primaryAccent = Colors.red[300];

    return ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.redAccent,
          backgroundColor: Colors.grey[900],
          titleTextStyle: darkTextTheme.headline6,
        ),
        textTheme: darkTextTheme,
        colorScheme: ColorScheme(
            primary: primaryDark!,
            primaryVariant: primaryAccent!,
            onPrimary: Colors.white,
            background: Colors.white,
            brightness: Brightness.dark,
            error: Colors.red,
            onBackground: Colors.black87,
            onError: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black87,
            secondary: primary!,
            secondaryVariant: primaryAccent,
            surface: Colors.white));
  }
}
