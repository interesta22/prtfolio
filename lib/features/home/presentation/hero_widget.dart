import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/home/presentation/hero_texts.dart';
import 'package:portfolio/features/home/presentation/herp_image.dart';
import 'package:portfolio/features/home/presentation/widgets/cv.dart';
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
        Expanded(
          child: SizedBox(height: context.height * 0.7, child: HeroImage()),
        ),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroTexts(),
              Gap(Insets.xxl),
              DownloadCVButton(
                cvUrl:
                    'https://drive.google.com/file/d/1PqG277to1259scPwA7UsQ5q-iS7a_A79/view?usp=sharing',
                title: context.loc.view_my_cv,
              ),
            ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(width: context.width * 0.6, child: HeroImage()),
            ),
            Gap(Insets.xl),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroTexts(),
                  Gap(Insets.xl),
                  DownloadCVButton(
                    cvUrl:
                        'https://drive.google.com/file/d/1PqG277to1259scPwA7UsQ5q-iS7a_A79/view?usp=sharing',
                    title: context.loc.view_my_cv,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
