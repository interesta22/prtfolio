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
      AppMenu(title: context.loc.about, route: Routes.about),
      AppMenu(title: context.loc.education, route: Routes.education),
      AppMenu(title: context.loc.skills, route: Routes.skills),
      AppMenu(title: context.loc.work, route: Routes.work),
      AppMenu(title: context.loc.services, route: Routes.services),
      AppMenu(title: context.loc.projects, route: Routes.projects),
      AppMenu(title: context.loc.contact, route: Routes.contact),
    ];
  }
}