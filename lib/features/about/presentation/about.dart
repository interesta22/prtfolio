import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/core/extension/extensions.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // الكلمات اللي عايزين نعملها هايلايت
    final highlights = [
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

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.loc.aboutTitle,
            style: context.textStyles.titleMdMedium.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _buildRichText(
              context.loc.aboutParagraph,
              highlights,
              context,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(
    String text,
    List<String> highlights,
    BuildContext context,
  ) {
    final spans = <TextSpan>[];
    final words = text.split(' ');

    for (final word in words) {
      if (highlights.any((h) => word.contains(h))) {
        spans.add(
          TextSpan(
            text: "$word ",
            style: context.textStyles.bodyLgMedium.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(text: "$word ", style: context.textStyles.bodyLgMedium),
        );
      }
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(
          context,
        ).style.copyWith(fontSize: 16, height: 1.6),
        children: spans,
      ),
    );
  }
}
