import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.light,
  );

  static TextTheme _textTheme(Color color) => TextTheme(
    headlineLarge: AppTextStyles.styleW600s24(color: color),
    headlineMedium: AppTextStyles.styleW600s20(color: color),
    headlineSmall: AppTextStyles.styleW500s20(color: color),
    titleLarge: AppTextStyles.styleW500s18(color: color),
    titleMedium: AppTextStyles.styleW600s16(color: color),
    titleSmall: AppTextStyles.styleW600s14(color: color),
    bodyLarge: AppTextStyles.styleW500s16(color: color),
    bodyMedium: AppTextStyles.styleW400s16(color: color),
    bodySmall: AppTextStyles.styleW400s14(color: color),
    labelLarge: AppTextStyles.styleW500s14(color: color),
  );

  static ThemeData lightTheme = ThemeData(
    hintColor: AppColors.lightSecTextColor,
    hoverColor: AppColors.darkBgColor,
    scaffoldBackgroundColor: AppColors.lightBgColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      primary: AppColors.mainColor,
      brightness: Brightness.light,
    ),
    textTheme: _textTheme(AppColors.lightTextColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBgColor,
      foregroundColor: AppColors.mainColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.styleW500s18(color: AppColors.mainColor),
      iconTheme: IconThemeData(color: AppColors.mainColor),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    hintColor: AppColors.mainColor,
    hoverColor: AppColors.darkSecTextColor,
    scaffoldBackgroundColor: AppColors.darkBgColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      primary: AppColors.mainColor,
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme(AppColors.darkTextColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      foregroundColor: AppColors.mainColor,
      elevation: 0,
      centerTitle: true,

      titleTextStyle: AppTextStyles.styleW500s18(color: AppColors.mainColor),
      iconTheme: IconThemeData(color: AppColors.mainColor),
    ),
  );
}
