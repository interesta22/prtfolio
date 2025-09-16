import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';
import 'package:portfolio/features/projects/presentation/project_details.dart'; // الصفحة الجديدة للتفاصيل

class ProjectsListPage extends StatelessWidget {
  const ProjectsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
        name: 'Deadbot',
        shortDescription: context.loc.deadbot_short,
        longDescription: context.loc.deadbot_long,
        coverImage: 'assets/images/deadbot_icon.png',
        techStack: ['Flutter', 'Firebase', 'API'],
        galleryImages: [
          'assets/images/photo_2025-08-29_16-23-38.jpg',
          'assets/images/photo_2025-08-29_16-23-40.jpg',
          'assets/images/photo_2025-08-29_16-23-42.jpg',
          'assets/images/photo_2025-08-29_16-23-41.jpg',
          'assets/images/photo_2025-08-29_16-23-43.jpg',
          'assets/images/photo_2025-08-29_16-23-44.jpg',
          'assets/images/photo_2025-08-29_16-23-45.jpg',
        ],
        liveDemoLink: 'https://example.com',
        downloadLink: 'https://playstore.com/app',
      ),
      Project(
        name: 'Tawseela',
        shortDescription: context.loc.tawseela_short,
        longDescription: context.loc.tawseela_long,
        coverImage: 'assets/images/roof-rack_4550036.png',
        techStack: ['Flutter', 'Firebase'],
        galleryImages: [
          'assets/images/photo_2025-08-29_16-18-25.jpg',
          'assets/images/photo_2025-08-29_16-18-27.jpg',
          'assets/images/photo_2025-08-29_16-18-30.jpg',
          'assets/images/photo_2025-08-29_16-18-31.jpg',
          'assets/images/photo_2025-08-29_16-18-33.jpg',
          'assets/images/photo_2025-08-29_16-18-34.jpg',
          'assets/images/photo_2025-08-29_16-18-35.jpg',
          'assets/images/photo_2025-08-29_16-18-37.jpg',
          'assets/images/photo_2025-08-29_16-18-38.jpg',
          'assets/images/photo_2025-08-29_16-18-39.jpg',
          'assets/images/photo_2025-08-29_16-18-40.jpg',
          'assets/images/photo_2025-08-29_16-18-42.jpg',
          'assets/images/photo_2025-08-29_16-20-01.jpg',
          'assets/images/photo_2025-08-29_16-20-03.jpg',
          'assets/images/photo_2025-08-29_16-20-06.jpg',
        ],
        liveDemoLink: 'https://example.com',
        downloadLink: 'https://playstore.com/app',
      ),
      Project(
        name: 'Kaliha 3alina',
        shortDescription: context.loc.k3_short,
        longDescription: context.loc.k3_long,
        coverImage: 'assets/images/k3_icon.png',
        techStack: ['Flutter', 'Firebase'],
        galleryImages: [
          'assets/images/photo_2025-07-05_19-22-21.jpg',
          'assets/images/photo_2025-07-05_19-22-22.jpg',
          'assets/images/photo_2025-08-29_16-20-56.jpg',
          'assets/images/photo_2025-08-29_16-20-54.jpg',
          'assets/images/photo_2025-08-29_16-20-52.jpg',
          'assets/images/photo_2025-08-29_16-20-47.jpg',
          'assets/images/photo_2025-08-29_16-20-46.jpg',
          'assets/images/photo_2025-08-29_16-20-45.jpg',
          'assets/images/photo_2025-08-29_16-20-43.jpg',
          'assets/images/photo_2025-08-29_16-20-44.jpg',
          'assets/images/photo_2025-08-29_16-20-41.jpg',
          'assets/images/photo_2025-08-29_16-20-40.jpg',
        ],
        liveDemoLink: 'https://example.com',
        downloadLink: 'https://playstore.com/app',
      ),
      Project(
        name: 'MemoMate',
        shortDescription: context.loc.memomate_short,
        longDescription: context.loc.memomate_long,
        coverImage: 'assets/images/memo_mate_icon.png',
        techStack: ['Flutter', 'Firebase'],
        galleryImages: ['assets/images/photo_2025-07-05_19-22-22.jpg'],
        liveDemoLink: 'https://example.com',
        downloadLink: 'https://playstore.com/app',
      ),
    ];
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                context.loc.projects,
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
          ProjectsSwiper(projects: projects),
        ],
      ),
    );
  }
}

class ProjectsSwiper extends StatelessWidget {
  const ProjectsSwiper({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    // عدد الكروت لكل صفحة
    final int itemsPerPage = context.isDesktop ? 3 : 1;

    void scrollTo(GlobalKey key) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }

    return SizedBox(
      height: context.isDesktop ? 350 : 250,
      child: Swiper(
        curve: Curves.easeInOut,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 10.0,
            activeSize: 13.0,
            space: 3.0,
            color: AppColors.primaryColor.withOpacity(0.3),
            activeColor: AppColors.primaryColor,
          ),
        ),
        control: const SwiperControl(color: AppColors.primaryColor),
        indicatorLayout: PageIndicatorLayout.SCALE,
        itemBuilder: (BuildContext context, int index) {
          final int start = index * itemsPerPage;
          final int end = (start + itemsPerPage).clamp(0, projects.length);
          final List<Project> group = projects.sublist(start, end);

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var project in group) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ProjectCard(
                    project: project,
                    onViewDetails: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProjectDetailPage(project: project),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ],
          );
        },
        itemCount: (projects.length / itemsPerPage).ceil(),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onViewDetails;

  const ProjectCard({super.key, required this.project, this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // البلور
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08), // شفافية
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // الصورة
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    project.coverImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // اسم المشروع
                      Text(
                        project.name,
                        style: context.textStyles.bodyLgMedium.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                      Gap(Insets.xs),

                      // الوصف القصير
                      Text(
                        project.shortDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.bodyMdMedium.copyWith(
                          fontSize: 9,
                          color: context.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),

                      Gap(Insets.xs),

                      // Tech Stack Chips
                      Gap(Insets.med),

                      // زرار View
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 35,
                          child: SecondaryButton(
                            title: context.loc.view,
                            onPressed: onViewDetails,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
