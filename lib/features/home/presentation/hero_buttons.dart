import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';

class SmallHeroButton extends StatelessWidget {
  const SmallHeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(title: context.loc.contact),
        Gap(Insets.xl),
        SecondaryButton(title: context.loc.cooperationRequest),
      ],
    ); // SizedBox
  }
}

class LargeHeroButton extends StatelessWidget {
  const LargeHeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(title: context.loc.contact),
        Gap(Insets.xxxl),
        SecondaryButton(title: context.loc.cooperationRequest),
      ],
    );
  }
}
