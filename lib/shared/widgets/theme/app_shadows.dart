import 'package:flutter/material.dart';

/// Shadow styles from Figma
class AppShadows {
  AppShadows._();

  static const List<BoxShadow> bottomNav = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(2, 2),
      blurRadius: 12,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(-2, -2),
      blurRadius: 12,
    ),
  ];
}
