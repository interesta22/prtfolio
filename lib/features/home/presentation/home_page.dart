import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/about/presentation/about.dart';
import 'package:portfolio/features/about/presentation/skills.dart';
import 'package:portfolio/features/about/presentation/contact.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/projects/presentation/projects.dart';
import 'package:portfolio/features/about/presentation/education_time_line.dart';
import 'package:portfolio/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio/features/home/presentation/widgets/blur_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.insets.appBarHeight),
        child: CustomAppBar(
          onItemSelected: (section) {
            switch (section) {
              case "home":
                _scrollTo(heroKey);
                break;
              case "about":
                _scrollTo(aboutKey);
                break;
              case "education":
                _scrollTo(educationKey);
                break;
              case "skills":
                _scrollTo(skillsKey);
                break;
              case "projects":
                _scrollTo(projectsKey);
                break;
              case "contact":
                _scrollTo(contactKey);
                break;
            }
          },
        ),
      ),
      body: Stack(
        children: [
          BackgroundBlur(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              child: Column(
                children: [
                  Container(key: heroKey, child: HeroWidget()),
                  Gap(Insets.xxxl),
                  Container(key: aboutKey, child: AboutSection()),
                  Gap(Insets.xxxl),
                  Container(key: educationKey, child: EducationTimeline()),
                  Gap(Insets.xxxl),
                  Container(key: skillsKey, child: SkillsSection()),
                  Gap(Insets.xxxl),
                  Container(key: projectsKey, child: ProjectsListPage()),
                  Container(key: contactKey, child: ContactSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
