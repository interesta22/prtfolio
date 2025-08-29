import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
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
    return Row(
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

        // الخط الأفقي + النقطة
        SizedBox(
          width: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الخط الأفقي الصغير
              Align(
                alignment: isLeft
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: SizedBox(
                  width: 75,
                  child: DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    dashLength: 4,
                    dashGapLength: 3,
                    lineThickness: 1,
                    dashColor: AppColors.gray[300]!,
                  ),
                ),
              ),

              // النقطة
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gray[300]!, width: 2),
                ),
              ),
            ],
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // ✅ يخلي العمود يلف حوالين الهيدر والتيملين
      children: [
        // ✅ الهيدر فوق خالص برا الخط
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

        // ✅ بدل Expanded → خلي Stack يلف حوالين الـ ScrollView
        SizedBox(
          height: 600, // أو MediaQuery.of(context).size.height * 0.7
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
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTimelineItem(
                      context: context,
                      subtitle: "Luxor University",
                      title: "Faculty of Computers and Information",
                      date: "Oct 2022 - Jun 2023",
                      isLeft: true,
                    ),
                    buildTimelineItem(
                      context: context,
                      additionalInfo: "Kafr El-Sheikh University",
                      title: "Faculty of Computers and Information",
                      subtitle: "CS Department",
                      date: "Oct 2023 - Present",
                      isLeft: false,
                    ),
                    buildTimelineItem(
                      context: context,
                      title: "Information Technology Institute",
                      subtitle: "Summer Training - Flutter Track",
                      additionalInfo: "Tanta Branch",
                      date: "Jul 2025 - Aug 2025",
                      isLeft: true,
                    ),
                    buildTimelineItem(
                      context: context,
                      title: "Digital Egypt Pioneers Initiative",
                      subtitle: "Flutter Track",
                      additionalInfo: "Alexandria",
                      date: "Jul 2025 - Present",
                      isLeft: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeLineItem extends StatelessWidget {
  TimeLineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    this.additionalInfo,
  });
  String title;
  String subtitle;
  String? additionalInfo;
  String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isDesktop ? 350 : double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyles.bodyLgMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Gap(Insets.xs),

          Text(
            subtitle,
            style: context.textStyles.bodyMdMedium.copyWith(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          additionalInfo != null
              ? Text(
                  additionalInfo!,
                  style: context.textStyles.bodyMdMedium.copyWith(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                )
              : const SizedBox.shrink(),

          Gap(Insets.xs),
          Text(
            date,
            style: context.textStyles.bodyMdMedium.copyWith(
              color: AppColors.primaryColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
