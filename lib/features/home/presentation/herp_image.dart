import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/extensions.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(250)),
        child: Image.asset(
          height: context.height * 0.7,
          'assets/images/photo_2024-09-05_21-59-31.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
