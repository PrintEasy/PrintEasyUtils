import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class AppColors {
  const AppColors._();

  static final Color primary = const Color(0xFFED1C24).o;
  static final Color onPrimary = const Color(0xFFFCD9DA).o;
  static final Color secondary = const Color(0xFF51C1E6).o;
  static final Color accent = const Color(0xFF2C72DB).o;

  static final Color background = const Color(0xFFFEF6F7).o;
  static final Color primaryBackground = const Color(0xFFFED482).o;

  static final Color white = const Color(0xFFFFFFFF).o;
  static final Color black = const Color(0xFF000000).o;

  static final MaterialColor grey = MaterialColor(0xFFE0DADA.oi, {
    300: const Color(0xFFF9F9F9).o,
    500: const Color(0xFFE0DADA).o,
    700: const Color(0xFF8B8686).o,
    900: const Color(0xFF717171).o,
  });

  static final Color error = const Color(0xFFF44336).o;
}
