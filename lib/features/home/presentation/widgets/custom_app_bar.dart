import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/core/style/app_text_styles.dart';
import 'package:portfolio/core/constants/app_menu_list.dart';
import 'package:portfolio/features/home/presentation/cubit/theme_cubit.dart';
import 'package:portfolio/features/home/presentation/cubit/locale_cubit.dart';
import 'package:portfolio/features/home/presentation/widgets/app_bar_drawer_icon.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.center,
      height: context.insets.appBarHeight,
      padding: EdgeInsets.symmetric(
        horizontal: context.insets.padding,
        vertical: Insets.xs,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: Row(
          children: [
            AppLogo(),
            if (context.isDesktop) Expanded(child: LargeMenu()) else Spacer(),
            LanguageToggle(
              onLangSelected: (lang) {
                context.read<LocaleCubit>().changeLanguage(lang);
              },
            ),
            ThemeToggle(),
            if (context.isMobile || context.isTablet) ...[AppBarDrawerIcon()],
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset("assets/images/gradient-az-za-logo-template.png"),
    );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: AppMenuList.getItems(context).map((item) {
        return LargeAppBarMenuItem(
          text: item.title,
          onPressed: () {
            Navigator.pushNamed(context, item.route);
          },
          isSelected: ModalRoute.of(context)?.settings.name == item.route,
        );
      }).toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        child: Text(text, style: SmallTextStyle().bodyLgMedium),
      ),
    );
  }
}

class LanguageToggle extends StatefulWidget {
  final Function(String) onLangSelected;
  const LanguageToggle({super.key, required this.onLangSelected});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ✅ بعد أي rebuild (زي لما تكبر/تصغر الشاشة) نقفل أي popup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return; // widget اتشال خلاص
      // اقفل أي popup مفتوح بأمان
      OverlayState? overlay = Overlay.of(context, rootOverlay: true);
      overlay?.context.findRenderObject(); // مجرد touch عشان يضمن إنه valid
      Navigator.of(
        context,
        rootNavigator: true,
      ).popUntil((route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.language, size: 24),
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: "en",
            child: Row(
              children: [
                Text("🇺🇸 ", style: TextStyle(fontSize: 18)),
                SizedBox(width: 6),
                Text("English"),
              ],
            ),
          ),
          PopupMenuItem(
            value: "ar",
            child: Row(
              children: [
                Text("🇪🇬 ", style: TextStyle(fontSize: 18)),
                SizedBox(width: 6),
                Text("العربية"),
              ],
            ),
          ),
        ];
      },
      onSelected: widget.onLangSelected,
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state;

    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: isDark,
        onChanged: (value) {
          context.read<ThemeCubit>().toggleTheme();
        },
        thumbIcon: MaterialStateProperty.resolveWith<Icon?>((states) {
          if (isDark) {
            return const Icon(Icons.nightlight_round, color: Colors.white);
          } else {
            return const Icon(
              Icons.wb_sunny,
              color: AppColors.darkBackgroundColor,
            );
          }
        }),
        activeColor: AppColors.primaryColor, // لون أساسي عند الدارك
        inactiveThumbColor: Colors.white, // لون الشمس
        inactiveTrackColor: Colors.white.withOpacity(
          0.5,
        ), // خلفية فاتحة للـ Light
        activeTrackColor: AppColors.primaryColor.withOpacity(
          0.5,
        ), // خلفية غامقة للـ Dark
      ),
    );
  }
}
