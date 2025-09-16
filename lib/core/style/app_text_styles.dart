import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get titleSmBold;
  TextStyle get titleMdMedium;
  TextStyle get titleLgBold;
  TextStyle get bodyMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
}

class SmallTextStyle implements AppTextStyles {
  @override
  TextStyle get titleSmBold => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get titleMdMedium => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get titleLgBold => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyLgBold => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );
}

class LargeTextStyle implements AppTextStyles {
  @override
  TextStyle get titleSmBold => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get titleMdMedium => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get titleLgBold => const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyLgBold => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'NotoSans',
  );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'NotoSans',
  );
}
