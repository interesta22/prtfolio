import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktopOrTablet;

    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          context.loc.heroTitle,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyles.titleLgBold.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        Gap(isDesktop ? Insets.med : Insets.xs),
        Text(
          context.loc.mobileAppDeveloper,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyles.titleMdMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        Gap(Insets.med),
        Text(
          context.loc.heroDescription,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: context.textStyles.bodyLgMedium.copyWith(
            color: context.colorScheme.onSurface,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
