import 'dart:ui';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';

class EducationTimeline extends StatelessWidget {
  const EducationTimeline({super.key});

  Widget buildTimelineItem({
    required String title,
    required String subtitle,
    required String date,
    String? additionalInfo,
    required bool isLeft,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // left card
          Expanded(
            child: isLeft
                ? Align(
                    alignment: Alignment.centerRight,
                    child: TimeLineItem(
                      title: title,
                      subtitle: subtitle,
                      date: date,
                      additionalInfo: additionalInfo,
                    ),
                  )
                : const SizedBox(),
          ),
          // النقطة بس (دايرة فيها أيقونة)
          SizedBox(
            width: 75,
            child: Center(
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.school, // 🎓 ايكون معبرة (ممكن تغيرها حسب الـ item)
                  color: context.colorScheme.surface,
                  size: context.isMobile ? 18 : 20,
                ),
              ),
            ),
          ),

          // right card
          Expanded(
            child: !isLeft
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: TimeLineItem(
                      title: title,
                      subtitle: subtitle,
                      date: date,
                      additionalInfo: additionalInfo,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ✅ الهيدر
        Column(
          children: [
            Text(
              context.loc.education,
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

        Gap(Insets.xxl),

        // ✅ Desktop/Tablet → Timeline يمين وشمال
        // ✅ Mobile → Timeline عمود واحد
        if (!isMobile)
          SizedBox(
            height: 600,
            child: Stack(
              children: [
                // الخط العمودي الأساسي
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 2,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.primaryColor.withOpacity(0.9),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),

                // الـ items
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    buildTimelineItem(
                      context: context,
                      title: context.loc.faculty_computers_info,
                      subtitle: context.loc.luxor_university,
                      date: context.loc.date_oct2022_jun2023,
                      isLeft: true,
                    ),
                    buildTimelineItem(
                      context: context,
                      additionalInfo: context.loc.kfs_university,
                      title: context.loc.faculty_computers_info,
                      subtitle: context.loc.cs_department,
                      date: context.loc.date_oct2023_present,
                      isLeft: false,
                    ),
                    buildTimelineItem(
                      context: context,
                      title: context.loc.iti,
                      subtitle: context.loc.summer_training_flutter,
                      additionalInfo: context.loc.tanta_branch,
                      date: context.loc.date_jul2025_aug2025,
                      isLeft: true,
                    ),
                    buildTimelineItem(
                      context: context,
                      title: context.loc.depi,
                      subtitle: context.loc.flutter_track,
                      additionalInfo: context.loc.alexandria,
                      date: context.loc.date_jul2025_present,
                      isLeft: false,
                    ),
                  ],
                ),
              ],
            ),
          )
        else
          // ✅ Mobile → ListView عمود واحد
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              TimeLineItem(
                title: context.loc.faculty_computers_info,
                subtitle: context.loc.luxor_university,
                date: context.loc.date_oct2022_jun2023,
              ),
              TimeLineItem(
                title: context.loc.faculty_computers_info,
                subtitle: context.loc.cs_department,
                additionalInfo: context.loc.kfs_university,
                date: context.loc.date_oct2023_present,
              ),
              TimeLineItem(
                title: context.loc.iti,
                subtitle: context.loc.summer_training_flutter,
                additionalInfo: context.loc.tanta_branch,
                date: context.loc.date_jul2025_aug2025,
              ),
              TimeLineItem(
                title: context.loc.depi,
                subtitle: context.loc.flutter_track,
                additionalInfo: context.loc.alexandria,
                date: context.loc.date_jul2025_present,
              ),
            ],
          ),
      ],
    );
  }
}

class TimeLineItem extends StatelessWidget {
  const TimeLineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    this.additionalInfo,
  });

  final String title;
  final String subtitle;
  final String? additionalInfo;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // البلور
        child: Container(
          width: context.isDesktop ? 350 : double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15), // شفافية
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.3), // خط خارجي خفيف
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textStyles.bodyLgMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.onSurface,
                ),
              ),
              Gap(Insets.xs),
              Text(
                subtitle,
                style: context.textStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              if (additionalInfo != null)
                Text(
                  additionalInfo!,
                  style: context.textStyles.bodyMdMedium.copyWith(
                    color: context.colorScheme.onSurface.withOpacity(0.65),
                  ),
                ),
              Gap(Insets.xs),
              Text(
                date,
                style: context.textStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
