import 'package:flutter/material.dart';
import 'package:printeasy_utils/src/theme/theme.dart';

ThemeData kAppTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.background,
  ),
);
