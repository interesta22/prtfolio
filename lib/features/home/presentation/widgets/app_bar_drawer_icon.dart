import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_menu_list.dart';

class AppBarDrawerIcon extends StatefulWidget {
  const AppBarDrawerIcon({super.key});

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
                    Navigator.pushNamed(context, item.route);
                    _toggleMenu(context);
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
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
    );
  }
}
