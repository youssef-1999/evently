import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle styleW600s20({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color);
  static TextStyle styleW500s20({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color);

  static TextStyle styleW600s14({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color);
  static TextStyle styleW600s16({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color);

  static TextStyle styleW600s24({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: color);
  static TextStyle styleW500s18({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: color);
  static TextStyle styleW500s16({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);

  static TextStyle styleW500s14({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color);

  static TextStyle styleW400s16({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color);
  static TextStyle styleW400s14({Color color = AppColors.lightTextColor}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);
}
