import 'package:flutter/material.dart';
import 'theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Lexend',
    brightness: Brightness.light,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: 'Lexend',
    brightness: Brightness.dark,
  );
}
