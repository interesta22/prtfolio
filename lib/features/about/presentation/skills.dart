import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        "icon": LucideIcons.users,
        "title": context.loc.teamwork,
        "subtitle": context.loc.teamworksubtitle,
      },
      {
        "icon": LucideIcons.messageCircle,
        "title": context.loc.communication,
        "subtitle": context.loc.communicationsubtitle,
      },
      {
        "icon": LucideIcons.presentation,
        "title": context.loc.presentation,
        "subtitle": context.loc.presentationsubtitle,
      },
      {
        "icon": LucideIcons.clock,
        "title": context.loc.time_management,
        "subtitle": context.loc.time_managementsubtitle,
      },
      {
        "icon": LucideIcons.globe,
        "title": context.loc.remote_collaboration,
        "subtitle": context.loc.remote_collaborationsubtitle,
      },
      {
        "icon": LucideIcons.refreshCw,
        "title": context.loc.adaptability,
        "subtitle": context.loc.adaptabilitysubtitle,
      },
      {
        "icon": LucideIcons.userCog,
        "title": context.loc.team_leadership,
        "subtitle": context.loc.team_leadershipsubtitle,
      },
      {
        "icon": LucideIcons.brain,
        "title": context.loc.problem_solving,
        "subtitle": context.loc.problem_solvingsubtitle,
      },
    ];

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Skills",
            style: context.textStyles.titleLgBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),

          // 🌀 Swiper يجيب الكروت من skills
          SizedBox(
            height: 200,
            child: Swiper(
              pagination: const SwiperPagination(),
              control: const SwiperControl(color: AppColors.primaryColor),
              indicatorLayout: PageIndicatorLayout.SCALE,
              itemBuilder: (BuildContext context, int index) {
                final group;
                if (context.isDesktop) {
                  final start = index * 3;
                  final end = (start + 3).clamp(0, skills.length);
                  group = skills.sublist(start, end);
                } else {
                  final start = index * 1;
                  final end = (start + 1).clamp(0, skills.length);
                  group = skills.sublist(start, end);
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var skill in group) ...[
                      _AboutCard(
                        icon: skill["icon"] as IconData,
                        title: skill["title"] as String,
                        description: skill["subtitle"] as String,
                      ),
                      const SizedBox(width: 12),
                    ],
                  ],
                );
              },
              itemCount: (skills.length / 3).ceil(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 150, // مستطيل أفقي
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary.withOpacity(0.3), // نفس لون الـ blur
            context.colorScheme.primary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.02),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Icon(icon, size: 36, color: AppColors.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
