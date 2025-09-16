import 'package:flutter/material.dart';
import 'package:portfolio/core/routes/routes.dart';
import 'package:portfolio/core/extension/extensions.dart';

class AppMenu {
  final String title;
  final String route;

  AppMenu({required this.title, required this.route});
}

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.loc.home, route: 'home'),
      AppMenu(title: context.loc.about, route: 'about'),
      AppMenu(title: context.loc.education, route: 'education'),
      AppMenu(title: context.loc.skills, route: 'skills'),
      AppMenu(title: context.loc.projects, route: 'projects'),
      AppMenu(title: context.loc.contact, route: 'contact'),
    ];
  }
}
