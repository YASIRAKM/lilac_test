import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';

class AppTextStyles {
 
  static const TextStyle title = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle appBartitle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle hintText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: AppColors.fadedTextColor,
  );

  

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle subtitle1 = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.fadedTextColor);
  static const TextStyle subtitle2 = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.primary);

  static const TextStyle bodyText1 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor);

  static const TextStyle button1 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: AppColors.buttonTextColor);
}
