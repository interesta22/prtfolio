import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';

class AppTheme {
  ThemeData get darkTheme => _getThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: AppColors.darkBackgroundColor,
      surface: AppColors.gray[800]!,
      outline: AppColors.gray[800]!,
      outlineVariant: AppColors.gray[700]!,
      onBackground: AppColors.gray[100],
      onSurface: AppColors.gray[300]!,
      onSurfaceVariant: AppColors.gray[400]!,
      tertiary: AppColors.gray[900]!,
    ),
    appBarTheme: AppBarTheme(color: AppColors.darkBackgroundColor),
  );

  ThemeData get lightTheme => _getThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      background: AppColors.gray[100]!,
      surface: AppColors.gray[200]!,
      outline: AppColors.gray[300]!,
      outlineVariant: AppColors.gray[400]!,
      onBackground: AppColors.gray[800],
      onSurface: AppColors.gray[700]!,
      onSurfaceVariant: AppColors.gray[600]!,
      tertiary: AppColors.gray[900]!,
    ),
    appBarTheme: AppBarTheme(color: AppColors.gray[100]),

    scaffoldBackgroundColor: AppColors.gray[100]!,
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

      // ✅ زرار السويتش (مظبوط للدارك واللايت)
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary; // لون الدائرة لما يكون on
          }
          return colorScheme.inverseSurface; // لون الدائرة لما يكون off
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary.withOpacity(
              0.5,
            ); // لون المسار لما يكون on
          }
          return colorScheme.surfaceVariant; // لون المسار لما يكون off
        }),
      ),

      //   (elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //       fixedSize: WidgetStateProperty.all(Size.fromHeight(48)),
      //       padding: WidgetStateProperty.all(
      //         EdgeInsets.symmetric(vertical: 10, horizontal: Insets.xl),
      //       ),
      //       textStyle: WidgetStatePropertyAll(
      //         const TextStyle(fontWeight: FontWeight.w500),
      //       ),
      //       foregroundColor: WidgetStatePropertyAll(
      //         AppColors.gray[100],
      //       ), // ✅ لون التكست
      //       backgroundColor: WidgetStatePropertyAll(
      //         AppColors.primaryColor,
      //       ), // ✅ لون الباك
      //     ),
      //   ),
      //   outlinedButtonTheme: OutlinedButtonThemeData(
      //     style: ButtonStyle(
      //       fixedSize: WidgetStateProperty.all(Size.fromHeight(48)),
      //       padding: WidgetStateProperty.all(
      //         EdgeInsets.symmetric(vertical: 10, horizontal: Insets.xl),
      //       ),
      //       textStyle: WidgetStatePropertyAll(
      //         const TextStyle(fontWeight: FontWeight.w500),
      //       ),
      //       foregroundColor: WidgetStatePropertyAll(
      //         AppColors.gray[800],
      //       ), // ✅ لون التكست
      //     ),
      //   ),
      // );)
    );
  }

  // final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
  //   if (states.contains(WidgetState.hovered) ||
  //       states.contains(WidgetState.pressed)) {
  //     return BorderSide(color: Color(0xff561895).withOpacity(0.7));
  //   }
  //   return const BorderSide(color: AppColors.primaryColor);
  // });

  // final _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
  //   if (states.contains(WidgetState.hovered) ||
  //       states.contains(WidgetState.pressed)) {
  //     return BorderSide(color: const Color(0xff561895).withOpacity(0.7));
  //   }
  //   return const BorderSide(color: Color(0xff561895));
  // });

  // WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
  //     WidgetStatePropertyAll(
  //       TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
  //     ); // TextStyle // WidgetStatePropertyAll
  // // TextStyle // WidgetStatePropertyAll
  // WidgetStatePropertyAll<TextStyle> get _darkOutlinedButtonTextStyle =>
  //     WidgetStatePropertyAll(
  //       TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
  //     );

  // WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
  //     WidgetStatePropertyAll(
  //       TextStyle(color: AppColors.gray[100], fontWeight: FontWeight.w500),
  //     );

  // WidgetStatePropertyAll<TextStyle> get _lightOutlinedButtonTextStyle =>
  //     WidgetStatePropertyAll(
  //       TextStyle(color: AppColors.gray[800], fontWeight: FontWeight.w500),
  //     );
}
