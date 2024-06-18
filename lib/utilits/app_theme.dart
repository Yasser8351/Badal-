import 'package:flutter/material.dart';

const kcPrimarySwatch = MaterialColor(0xffD973AB, {
  // 50: Color(0xfffbf6df),
  // 100: Color(0xfff6e7af),
  // 200: Color(0xfff0d87b),
  // 300: Color(0xffebca44),
  // 400: Color(0xffe8be15),
  // 500: Color(0xffe5b300),
  // 600: Color(0xffe6a600),
  // 700: Color(0xffe69400),
  // 800: Color(0xffe68300),
  // 900: Color(0xff063970),
});

const kcAccentColorSwatch = MaterialColor(0xffF9D3E7, {
  // 50: Color(0xff1E81A1),
  // 100: Color(0xff1E81A2),
  // 200: Color(0xff1E81A3),
  // 300: Color(0xff1E81A4),
  // 400: Color(0xff1E81A5),
  // 500: Color(0xff1E81A6),
  // 600: Color(0xff1E81A7),
  // 700: Color(0xff1E81A8),
  // 800: Color(0xff1E81A9),
  // 900: Color(0xff1E81A0),
});

const kcPrimary = Color(0xffD973AB);
const kcAccent = Color(0xffF9D3E7);
// #21C179 #D973AB
const kcAccentDark = Color(0xffEB81B3);
const kcAccentLight = Color(0xffF9ECF3);
// const kcAccentLight = Color(0xffFBEAF3);

/////////////////////////////////////
const Color kGrey = Color(0xffFCFCFC);
const Color kcGreyDark = Color(0xff868686);
const Color kcGreyLightDark = Color(0xff9E9E9E);
const Color kcGreyLight = Color(0xffADADAD);
const Color kcGreyVeryLight = Color(0xFFF5F5F5);
final Color kcGrey600 = Colors.grey.shade600;
const Color kcBlackDark = Color(0xff0F172A);

final lightTheme = ThemeData(
  fontFamily: 'markazi',
  iconTheme: const IconThemeData(size: 24.0, color: Colors.black87),
  splashColor: kcPrimary,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    alignment: Alignment.center,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: kcPrimary,
  ),

  hoverColor: const Color.fromARGB(255, 212, 212, 212),
  checkboxTheme: const CheckboxThemeData(
    fillColor: MaterialStatePropertyAll(kcPrimary),
  ),
  // primaryIconTheme: const IconThemeData(color: kcPrimary),

  indicatorColor: Colors.white,
  dividerColor: Colors.grey,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: kcPrimary),
    displayMedium: TextStyle(color: kcPrimary),
    bodyMedium: TextStyle(color: kcPrimary),
    titleMedium: TextStyle(color: kcPrimary),
    bodyLarge: TextStyle(color: kcPrimary),
    displaySmall: TextStyle(color: kcPrimary), //kcBlack54
    headlineMedium: TextStyle(color: kcPrimary),
    headlineSmall: TextStyle(color: kcPrimary),
    titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
  ),
);
