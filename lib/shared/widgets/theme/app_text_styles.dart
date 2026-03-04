import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text styles from Figma - Use Pretendard font family
/// All text styles have lineHeight: 1.6 and letterSpacing: -2%
class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Pretendard';

  // Body styles (from Figma)
  static const TextStyle body01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: -0.36,
  );

  static const TextStyle body02 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.36,
  );

  static const TextStyle body03 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle body04 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle body05 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: -0.28,
  );

  static const TextStyle body06 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.28,
  );

  // Caption styles
  static const TextStyle caption01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: -0.24,
  );

  static const TextStyle caption02 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.24,
  );

  // Label styles
  static const TextStyle label01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: -0.2,
  );

  static const TextStyle label02 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.2,
  );

  // Button text styles
  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle buttonLogin = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle buttonMember = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.6,
    letterSpacing: -0.28,
  );

  static const TextStyle buttonState = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.6,
    letterSpacing: -0.28,
  );

  static const TextStyle chipState = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
  );

  // Chip text styles
  static TextStyle chipGroup = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
    color: AppColors.green3,
  );

  // Navigation text styles
  static const TextStyle navLabel = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
  );

  // TopBar title
  static TextStyle topBarTitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
    color: AppColors.textPrimary,
  );

  // Dialog text styles
  static TextStyle dialogTitle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.6,
    letterSpacing: -0.36,
    color: AppColors.textPrimary,
  );

  static TextStyle dialogBody = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
    color: AppColors.textSecondary,
  );

  // TextField styles
  static const TextStyle textFieldLabel = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle textFieldInput = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle textFieldHint = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  static const TextStyle textFieldCounter = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.6,
    letterSpacing: -0.28,
  );

  static const TextStyle textFieldError = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
  );

  // General body styles
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.6,
    letterSpacing: -0.24,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.6,
    letterSpacing: -0.28,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.6,
    letterSpacing: -0.32,
  );

  // Headline styles
  static TextStyle headline1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.6,
    letterSpacing: -0.48,
    color: AppColors.textPrimary,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.6,
    letterSpacing: -0.4,
    color: AppColors.textPrimary,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.6,
    letterSpacing: -0.36,
    color: AppColors.textPrimary,
  );
}
