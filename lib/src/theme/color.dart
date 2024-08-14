import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFFED1C24);
  static const Color onPrimary = Color(0xFFFCD9DA);
  static const Color imageBackground = Color(0xFFFFF1F2);
  static const Color secondary = Color(0xFF51C1E6);

  static const MaterialColor accent = MaterialColor(0xFF2C72DB, {
    500: Color(0xFF2C72DB),
    900: Color(0xFF04275C),
  });

  static const Color background = Color(0xFFFEF6F7);
  static const Color primaryBackground = Color(0xFFFED482);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const MaterialColor grey = MaterialColor(0xFFE0DADA, {
    300: Color(0xFFF9F9F9),
    500: Color(0xFFE0DADA),
    700: Color(0xFF8B8686),
    900: Color(0xFF717171),
  });

  static const Color error = Color(0xFFF44336);

  static const List<Color> greyGradient = [
    Color(0xFFBED3D5),
    Color(0xFF537375),
  ];

  static const List<Color> accentGradient = [
    Color(0xFFD47E00),
    Color(0xFFF89E31),
  ];
}
