import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/about/presentation/contact.dart';
import 'package:portfolio/features/home/presentation/contact_page.dart';
import 'package:portfolio/features/about/presentation/collaporation.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';

class SmallHeroButton extends StatelessWidget {
  const SmallHeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(title: context.loc.contact, onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ContactPage()),
          ),),
        Gap(Insets.xl),
        SecondaryButton(
          title: context.loc.cooperationRequest,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CooperationPage()),
          ),
        ),
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
        PrimaryButton(title: context.loc.contact, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactSection())),),
        Gap(Insets.xxxl),
        SecondaryButton(title: context.loc.cooperationRequest),
      ],
    );
  }
}
