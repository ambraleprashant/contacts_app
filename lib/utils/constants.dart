import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.blue;
  static const background = Color(0xFFF5F5F5);
  static const textPrimary = Colors.black87;
  static const textSecondary = Colors.black54;
}

class AppTextStyles {
  static const headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
