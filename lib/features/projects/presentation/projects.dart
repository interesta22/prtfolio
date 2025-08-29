import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';
import 'package:portfolio/features/projects/data/models/project.dart'; // الصفحة الجديدة للتفاصيل

class ProjectsListPage extends StatelessWidget {
  ProjectsListPage({super.key});
  List<Project> projects = [
    Project(
      name: 'Deadbot',
      shortDescription: 'A fun app to do amazing things.',
      longDescription: 'This app allows users to manage tasks efficiently...',
      coverImage: 'assets/images/deadbot_icon.png',
      techStack: ['Flutter', 'Firebase', 'API'],
      galleryImages: [
        'assets/images/photo_2025-07-05_19-22-22.jpg',
        'assets/images/photo_2025-07-05_19-22-22.jpg',
      ],
      liveDemoLink: 'https://example.com',
      downloadLink: 'https://playstore.com/app',
      githubLink: 'https://github.com/username/project',
    ),
    Project(
      name: 'Tawseela',
      shortDescription: 'Another cool app for daily tasks.',
      longDescription: 'This app allows users to track their habits...',
      coverImage: 'assets/images/City driver-rafiki.png',
      techStack: ['Flutter', 'Firebase'],
      galleryImages: ['assets/images/photo_2025-07-05_19-22-22.jpg'],
      liveDemoLink: 'https://example.com',
      downloadLink: 'https://playstore.com/app',
      githubLink: 'https://github.com/username/project',
    ),
    Project(
      name: 'K3',
      shortDescription: 'Another cool app for daily tasks.',
      longDescription: 'This app allows users to track their habits...',
      coverImage: 'assets/images/k3_icon.png',
      techStack: ['Flutter', 'Firebase'],
      galleryImages: ['assets/images/photo_2025-07-05_19-22-22.jpg'],
      liveDemoLink: 'https://example.com',
      downloadLink: 'https://playstore.com/app',
      githubLink: 'https://github.com/username/project',
    ),
    Project(
      name: 'MemoMate',
      shortDescription: 'Another cool app for daily tasks.',
      longDescription: 'This app allows users to track their habits...',
      coverImage: 'assets/images/memo_mate_icon.png',
      techStack: ['Flutter', 'Firebase'],
      galleryImages: ['assets/images/photo_2025-07-05_19-22-22.jpg'],
      liveDemoLink: 'https://example.com',
      downloadLink: 'https://playstore.com/app',
      githubLink: 'https://github.com/username/project',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      height: 350,
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
                ProjectCard(
                  project: project,
                  onViewDetails: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ProjectDetailsPage(project: project),
                    //   ),
                    // );
                  },
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
  final VoidCallback? onViewDetails; // للزرار

  const ProjectCard({super.key, required this.project, this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // مهم عشان Swiper يحسب العرض
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.3),
              AppColors.primaryColor.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                project.coverImage,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 180,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المشروع
                  Text(
                    project.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),

                  // وصف قصير
                  Text(
                    project.shortDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 12),

                  // زرار View Details
                  Align(
                    alignment: Alignment.centerRight,
                    child: SecondaryButton(title: 'View'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
