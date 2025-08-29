import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';

class AppTheme {
  ThemeData get darkTheme => _getThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: AppColors.darkBackgroundColor,
      surface: AppColors.gray[850]!, // أغمق سنة من 800
      outline: AppColors.gray[700]!,
      outlineVariant: AppColors.gray[600]!,
      onBackground: AppColors.gray[100], // النص الفاتح
      onSurface: AppColors.gray[300]!, // النص الثانوي
      onSurfaceVariant: AppColors.gray[400]!,
      tertiary: AppColors.gray[900]!,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkBackgroundColor,
      elevation: 0,
    ),
  );

  ThemeData get lightTheme => _getThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      background: AppColors.gray[50]!, // أفتح
      surface: AppColors.gray[100]!, // card خفيفة
      outline: AppColors.gray[300]!,
      outlineVariant: AppColors.gray[400]!,
      onBackground: AppColors.gray[900], // النص الأساسي
      onSurface: AppColors.gray[700]!, // النص الثانوي
      onSurfaceVariant: AppColors.gray[600]!,
      tertiary: AppColors.gray[800]!,
    ),
    appBarTheme: AppBarTheme(color: AppColors.gray[50], elevation: 0),
    scaffoldBackgroundColor: AppColors.gray[50]!,
  );

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,

      // ✅ زرار السويتش
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.inverseSurface;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return colorScheme.surfaceVariant;
        }),
      ),
    );
  }
}
