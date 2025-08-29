import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:portfolio/core/style/app_size.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                context.loc.aboutTitle,
                style: context.textStyles.titleMdMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          Gap(Insets.xl),
          context.isDesktop
              ? Row(
                  children: [
                    Text(
                      "I'm Ahmed Abdul Aziz and ",
                      style: context.textStyles.titleSmBold.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: context.textStyles.titleSmBold.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "I'm Ahmed Abdul Aziz and ",
                      style: context.textStyles.titleMdMedium.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: context.textStyles.titleMdMedium.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
          Gap(Insets.xs),
          _buildRichText(context.loc.aboutParagraph, highlights, context),
          Gap(Insets.xxl),
          ProfileInfo(),
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

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  Widget buildInfoRow(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: context.isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(icon, color: AppColors.primaryColor, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: context.textStyles.bodyLgMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Icon(icon, color: AppColors.primaryColor, size: 22),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: context.textStyles.bodyLgMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العمود الأول
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow(
                      context,
                      LucideIcons.cake,
                      "Birthday: 17 October 2003",
                    ),
                    buildInfoRow(
                      context,
                      LucideIcons.phone,
                      "Phone: +20 01278576046",
                    ),
                    buildInfoRow(
                      context,
                      LucideIcons.mail,
                      "Email: ahmedabdulazizz203@gmail.com",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              // العمود الثاني
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow(context, LucideIcons.user, "Age: 22"),
                    buildInfoRow(
                      context,
                      LucideIcons.mapPin,
                      "City: Alexandria",
                    ),
                    buildInfoRow(
                      context,
                      LucideIcons.briefcase,
                      "Freelance: Available",
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              buildInfoRow(
                context,
                LucideIcons.cake,
                "Birthday: 17 October 2003",
              ),
              buildInfoRow(
                context,
                LucideIcons.phone,
                "Phone: +20 01278576046",
              ),
              buildInfoRow(
                context,
                LucideIcons.mail,
                "Email: ahmedabdulazizz203@gmail.com",
              ),
              buildInfoRow(context, LucideIcons.user, "Age: 22"),
              buildInfoRow(context, LucideIcons.mapPin, "City: Alexandria"),
              buildInfoRow(
                context,
                LucideIcons.briefcase,
                "Freelance: Available",
              ),
            ],
          );
  }
}
