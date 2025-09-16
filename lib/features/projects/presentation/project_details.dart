import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/features/home/presentation/widgets/cv.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:portfolio/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio/features/home/presentation/widgets/blur_background.dart';

// ... your existing imports

class ProjectDetailPage extends StatelessWidget {
  final Project project;
  ProjectDetailPage({super.key, required this.project});
  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // حماية من القيم الفارغة
    final coverImage = project.coverImage;
    final name = project.name;
    final gallery = project.galleryImages;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.insets.appBarHeight),
        child: CustomAppBar(
          onItemSelected: (section) {
            // Pop للـ HomePage ومعاه اسم السكشن المطلوب
            Navigator.pop(context, section);
          },
        ),
      ),

      body: Stack(
        children: [
          BackgroundBlur(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // App Icon (مع معالجة للخطأ)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            coverImage,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 70,
                              height: 100,
                              color: Colors.grey[200],
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // App Title & Rating
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: context.width * 0.6,
                              child: Text(
                                project.longDescription,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.bodyMdMedium.copyWith(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // "Get" button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: DownloadCVButton(
                      cvUrl:
                          'https://www.mediafire.com/file/sxbkgzi9ve3s4u8/app-release.apk/file?fbclid=IwdGRjcAMenP9jbGNrAx6c_GV4dG4DYWVtAjExAAEecizdvGeXqyw0q_sW5D_S-AWSMVeI_FtVs3tcD826kKEU6eOoMQ7jbKP-jKw_aem_dMDgFhN2yusnNaIdf69jWQ',
                      title: 'Get',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Screenshots Section header (زي ما هو)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Screenshots",
                          style: context.textStyles.titleSmBold.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Gallery: لو فاضي نظهر رسالة، وإلا Swiper (يحافظ على المظهر)
                  if (gallery.isEmpty)
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'No screenshots available',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: context.height * 0.5,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const desiredItemWidth = 300.0;
                          const separator = 12.0;

                          int crossAxisCount =
                              ((constraints.maxWidth + separator) /
                                      (desiredItemWidth + separator))
                                  .floor();
                          if (crossAxisCount < 1) crossAxisCount = 1;

                          return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gallery.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, // صف واحد بس
                                  mainAxisSpacing: separator,
                                  childAspectRatio:
                                      desiredItemWidth /
                                      (context.height * 0.25), // العرض / الطول
                                ),
                            itemBuilder: (ctx, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                gallery[index],
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
