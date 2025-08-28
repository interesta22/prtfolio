import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor.withOpacity(0.7);
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primaryColor.withOpacity(0.85);
          }
          return AppColors.primaryColor;
        }),
        fixedSize: WidgetStateProperty.all<Size>(const Size.fromHeight(48)),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: Insets.xl),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.pressed)) return 2;
          if (states.contains(WidgetState.hovered)) return 8;
          return 4;
        }),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const SecondaryButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.pressed)) {
            return const BorderSide(color: AppColors.primaryColor, width: 2);
          }
          return BorderSide(color: AppColors.gray[400]!, width: 1.5);
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor;
          }
          return AppColors.gray[400]!;
        }),
        fixedSize: WidgetStateProperty.all(Size.fromHeight(48)),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: Insets.xl),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
