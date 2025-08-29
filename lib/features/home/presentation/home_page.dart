import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/features/about/presentation/about.dart';
import 'package:portfolio/features/about/presentation/skills.dart';
import 'package:portfolio/features/about/presentation/contact.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/projects/presentation/projects.dart';
import 'package:portfolio/features/about/presentation/education_time_line.dart';
import 'package:portfolio/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio/features/home/presentation/widgets/blur_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundBlur(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 100,
              ),
              child: Column(
                children: [
                  HeroWidget(),
                  Gap(Insets.xxxl),
                  AboutSection(),
                  Gap(Insets.xxxl),
                  EducationTimeline(),
                  Gap(Insets.xxxl),
                  SkillsSection(),
                  Gap(Insets.xxxl),
                  ProjectsListPage(),
                  Contact(),
                ],
              ),
            ),
          ),

          // ✅ AppBar ثابت فوق
          Positioned(top: 0, left: 0, right: 0, child: CustomAppBar()),
        ],
      ),
    );
  }
}
