import 'package:flutter/material.dart';

/// Color System from Figma
class AppColors {
  AppColors._();

  // Main Colors
  static const Color mainColor = Color(0xFF0FD380);
  static const Color subColor = Color(0xFF47EA97);

  // Primary colors (aliases)
  static const Color primary = mainColor;
  static const Color primaryPressed = Color(0xFF00A775);
  static const Color primaryLight = Color(0xFFECFCF5);

  // Green palette
  static const Color green1 = Color(0xFFECFCF5);
  static const Color green2 = Color(0xFFD4F7E8);
  static const Color green3 = Color(0xFF00A775);

  // Gray palette
  static const Color gray0 = Color(0xFFF7F7F7);
  static const Color gray1 = Color(0xFFEFEFEF);
  static const Color gray2 = Color(0xFFDFDFDF);
  static const Color gray3 = Color(0xFFC1C1C1);
  static const Color gray4 = Color(0xFFA5A5A5);
  static const Color gray5 = Color(0xFF8B8B8B);
  static const Color gray6 = Color(0xFF6F6F6F);
  static const Color gray7 = Color(0xFF3D3D3D);
  static const Color gray8 = Color(0xFF242424);

  // Base colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color disabled = Color(0xFFDFDFDF);
  static const Color border = Color(0xFFDFDFDF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFF5F5F5);

  // Semantic colors
  static const Color orange = Color(0xFFFF7B30);
  static const Color red = Color(0xFFFF2E2E);
  static const Color yellow = Color(0xFFFFD643);
  static const Color kakaoYellow = Color(0xFFFCE64A);

  // Text colors
  static const Color textPrimary = Color(0xFF242424);
  static const Color textSecondary = Color(0xFF6F6F6F);
  static const Color textTertiary = Color(0xFF8B8B8B);
  static const Color textDisabled = Color(0xFFC1C1C1);

  // Social login colors
  static const Color kakaoBackground = Color(0xFFFCE64A);
  static const Color kakaoText = Color(0xFF242424);
  static const Color appleBackground = Color(0xFFFFFFFF);
  static const Color appleText = Color(0xFF242424);
  static const Color appleBorder = Color(0xFF242424);

  // State colors
  static const Color stateReady = Color(0xFFFFB800);
  static const Color stateMove = Color(0xFF0FD380);
  static const Color stateArrive = Color(0xFF00A775);
  static const Color stateBefore = Color(0xFFDFDFDF);

  // Chip state background colors
  static const Color chipBefore = Color(0xFFF5F5F5);
  static const Color chipReady = Color(0xFFFFF4D6);
  static const Color chipMove = Color(0xFFECFCF5);
  static const Color chipArrive = Color(0xFFD4F7E8);

  // Chip state text colors
  static const Color chipBeforeText = Color(0xFF9E9E9E);
  static const Color chipReadyText = Color(0xFFFFB800);
  static const Color chipMoveText = Color(0xFF0FD380);
  static const Color chipArriveText = Color(0xFF00A775);

  // Toggle colors
  static const Color toggleOn = Color(0xFF0FD380);
  static const Color toggleOff = Color(0xFFDFDFDF);
  static const Color toggleThumb = Color(0xFFFFFFFF);

  // Navigation colors
  static const Color navActive = Color(0xFF0FD380);
  static const Color navInactive = Color(0xFFC1C1C1);

  // TextField specific colors
  static const Color textFieldBorderDefault = Color(0xFFC1C1C1);
  static const Color textFieldBorderFocused = Color(0xFF0FD380);
  static const Color textFieldBorderError = Color(0xFFFF2E2E);
  static const Color textFieldPlaceholder = Color(0xFFC1C1C1);
  static const Color textFieldText = Color(0xFF242424);
  static const Color textFieldDisabledBg = Color(0xFFF7F7F7);
  static const Color textFieldDisabledText = Color(0xFFC1C1C1);
  static const Color textFieldError = Color(0xFFFF2E2E);
  static const Color textFieldSuccess = Color(0xFF0FD380);
}
