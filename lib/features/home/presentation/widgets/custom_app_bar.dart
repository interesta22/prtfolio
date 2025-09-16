import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';
import 'package:portfolio/core/style/app_text_styles.dart';
import 'package:portfolio/core/constants/app_menu_list.dart';
import 'package:portfolio/features/home/presentation/cubit/theme_cubit.dart';
import 'package:portfolio/features/home/presentation/cubit/locale_cubit.dart';

class CustomAppBar extends StatefulWidget {
  final void Function(String section) onItemSelected;
  const CustomAppBar({super.key, required this.onItemSelected});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // ✅ يخلي الزوايا ناعمة
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // ✅ Blur effect
        child: Container(
          height: context.insets.appBarHeight,
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withOpacity(0.02), // لون شفاف
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withOpacity(0.02),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Insets.maxWidth),
              child: Row(
                children: [
                  const AppLogo(),
                  if (context.isDesktop)
                    Expanded(
                      child: LargeMenu(onItemSelected: widget.onItemSelected),
                    )
                  else
                    const Spacer(),
                  LanguageToggle(
                    onLangSelected: (lang) {
                      context.read<LocaleCubit>().changeLanguage(lang);
                    },
                  ),
                  const ThemeToggle(),
                  if (context.isMobile || context.isTablet) ...[
                    AppBarDrawerIcon(onItemSelected: widget.onItemSelected),
                  ],
                ],
              ),
            ),
          ),
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
      height: 70,
      child: Image.asset("assets/images/gradient-az-za-logo-template.png"),
    );
  }
}

class LargeMenu extends StatelessWidget {
  final void Function(String section) onItemSelected;
  const LargeMenu({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LargeAppBarMenuItem(
          text: context.loc.home,
          onPressed: () => onItemSelected("home"),
          isSelected: false,
        ),
        LargeAppBarMenuItem(
          text: context.loc.about,
          onPressed: () => onItemSelected("about"),
          isSelected: false,
        ),
        LargeAppBarMenuItem(
          text: context.loc.education,
          onPressed: () => onItemSelected("education"),
          isSelected: false,
        ),
        LargeAppBarMenuItem(
          text: context.loc.skills,
          onPressed: () => onItemSelected("skills"),
          isSelected: false,
        ),
        LargeAppBarMenuItem(
          text: context.loc.projects,
          onPressed: () => onItemSelected("projects"),
          isSelected: false,
        ),
        LargeAppBarMenuItem(
          text: context.loc.contact,
          onPressed: () => onItemSelected("contact"),
          isSelected: false,
        ),
      ],
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
        child: Text(
          text,
          style: SmallTextStyle().bodyLgMedium.copyWith(
            color: isSelected
                ? AppColors.primaryColor
                : context.colorScheme.onSurface,
          ),
        ),
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
    // Removed auto-pop logic to avoid unintended navigation on resize.
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconSize: context.isMobile ? 20 : 25,
      icon: Icon(Icons.language, size: context.isMobile ? 20 : 25),
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
      scale: context.isMobile ? 0.7 : 0.8,
      child: Switch(
        value: isDark,
        onChanged: (value) {
          context.read<ThemeCubit>().toggleTheme();
        },
        thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
          if (isDark) {
            return const Icon(Icons.nightlight_round, color: Colors.white);
          } else {
            return const Icon(
              Icons.wb_sunny,
              color: AppColors.darkBackgroundColor,
            );
          }
        }),
        activeColor: AppColors.primaryColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.white.withOpacity(0.5),
        activeTrackColor: AppColors.primaryColor.withOpacity(0.5),
      ),
    );
  }
}

class AppBarDrawerIcon extends StatefulWidget {
  const AppBarDrawerIcon({super.key, required this.onItemSelected});
  final void Function(String section) onItemSelected;

  @override
  State<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends State<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  OverlayEntry? _overlayEntry;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _toggleMenu(BuildContext context) {
    if (isOpen) {
      controller.reverse();
      _removeOverlay();
    } else {
      controller.forward();
      _showOverlay(context);
    }
    setState(() => isOpen = !isOpen);
  }

  void _showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + renderBox.size.height,
        right: 16,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 200, // ✅ لازم نديها عرض محدد
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: AppMenuList.getItems(context).map((item) {
                return InkWell(
                  onTap: () {
                    widget.onItemSelected(item.route); // ✅ ابعت السكشن
                    _toggleMenu(context); // ✅ يقفل المينو بعد الاختيار
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(item.title),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _toggleMenu(context),
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: controller,
        size: context.isMobile ? 20 : 25,
      ),
    );
  }
}
