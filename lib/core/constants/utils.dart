import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';

List<String> getHighlights() => [
      "Flutter",
      "DEPI",
      "ITI",
      "Kafr El-Sheikh",
      "Luxor",
      "Computer Science",
      "Dart",
      "Firebase",
      "REST APIs",
      "Cubit",
      "Bloc",
      "Clean",
      "Scalable",
      "Maintainable",
      "علوم الحاسب",
      "كفر الشيخ",
      "مبادرة مصر الرقمية (DEPI)",
      "معهد تكنولوجيا المعلومات (ITI)",
      "نظيف",
      "قابل للتوسّع",
      "التجارب",
    ];

Widget buildRichText(String text, List<String> highlights, BuildContext context) {
  final spans = <TextSpan>[];
  final words = text.split(' ');

  for (final word in words) {
    if (highlights.any((h) => word.contains(h))) {
      spans.add(
        TextSpan(
          text: "$word ",
          style: context.textStyles.bodyMdMedium.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      spans.add(
        TextSpan(
          text: "$word ",
          style: context.textStyles.bodyMdMedium.copyWith(
            color: AppColors.gray[600],
          ),
        ),
      );
    }
  }

  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(children: spans),
  );
}
