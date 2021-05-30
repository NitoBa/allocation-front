import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColorLigth,
    cardColor: AppColors.whiteColor,
    primaryColor: AppColors.foregroundColor,
    accentColor: AppColors.titleColor,
    fontFamily: 'Lexend',
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.foregroundColor,
        fontSize: 25.sp,
      ),
      headline6: TextStyle(
        color: AppColors.foregroundColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: AppColors.titleColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        color: AppColors.foregroundColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  static var darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardColor: AppColors.foregroundColor,
    primaryColor: AppColors.whiteColor,
    accentColor: AppColors.grayLightColor,
    fontFamily: 'Lexend',
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.titleColor,
        fontSize: 25.sp,
      ),
      headline6: TextStyle(
        color: AppColors.titleColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: AppColors.grayLightColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        color: AppColors.titleColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
