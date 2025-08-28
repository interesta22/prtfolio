import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/home/presentation/hero_texts.dart';
import 'package:portfolio/features/home/presentation/herp_image.dart';
import 'package:portfolio/features/home/presentation/hero_buttons.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop ? _LargeHeroWidget() : _SmallHeroWidget();
  }
}

class _LargeHeroWidget extends StatelessWidget {
  const _LargeHeroWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: HeroImage()),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            children: [HeroTexts(), Gap(Insets.xxxl), LargeHeroButton()],
          ),
        ),
      ],
    );
  }
}

class _SmallHeroWidget extends StatelessWidget {
  const _SmallHeroWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300, child: HeroImage()),
        Gap(Insets.xl),
        HeroTexts(),
        Gap(Insets.xxl),
        SmallHeroButton(),
      ],
    );
  }
}
