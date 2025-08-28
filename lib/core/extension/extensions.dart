import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_size.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/l10n/app_localizations_en.dart';
import 'package:portfolio/core/style/app_text_styles.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyleContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 1000) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;
  bool get isDesktopOrTablet => isDesktop || isTablet;

  AppTextStyles get textStyles {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyle();
      case FormFactorType.desktop:
        return LargeTextStyle();
    }
  }

  ThemeData get theme => Theme.of(this);

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.tablet:
      case FormFactorType.mobile:
        return SmallAppInsets();
      case FormFactorType.desktop:
        return LargeAppInsets();
    }
  }

  AppLocalizations get loc => AppLocalizations.of(this) ?? AppLocalizationsEn();
  
  ColorScheme get colorScheme => theme.colorScheme;
}

extension LocMap on AppLocalizations {
  String getByKey(String key) {
    switch (key) {
      case "teamwork": return teamwork;
      case "teamworksubtitle": return teamworksubtitle;
      case "communication": return communication;
      case "communicationsubtitle": return communicationsubtitle;
      case "presentation": return presentation;
      case "presentationsubtitle": return presentationsubtitle;
      case "time_management": return time_management;
      case "time_managementsubtitle": return time_managementsubtitle;
      case "remote_collaboration": return remote_collaboration;
      case "remote_collaborationsubtitle": return remote_collaborationsubtitle;
      case "adaptability": return adaptability;
      case "adaptabilitysubtitle": return adaptabilitysubtitle;
      case "team_leadership": return team_leadership;
      case "team_leadershipsubtitle": return team_leadershipsubtitle;
      case "problem_solving": return problem_solving;
      case "problem_solvingsubtitle": return problem_solvingsubtitle;
      case "critical_thinking": return critical_thinking;
      case "critical_thinkingsubtitle": return critical_thinkingsubtitle;
      case "self_learning": return self_learning;
      case "self_learningsubtitle": return self_learningsubtitle;
      case "dart": return dart;
      case "dartsubtitle": return dartsubtitle;
      case "flutter": return flutter;
      case "fluttersubtitle": return fluttersubtitle;
      case "firebase": return firebase;
      case "firebasesubtitle": return firebasesubtitle;
      case "cpp": return cpp;
      case "cppsubtitle": return cppsubtitle;
      case "csharp": return csharp;
      case "csharpsubtitle": return csharpsubtitle;
      case "python": return python;
      case "pythonsubtitle": return pythonsubtitle;
      case "oop": return oop;
      case "oopsubtitle": return oopsubtitle;
      case "data_structures": return data_structures;
      case "data_structuressubtitle": return data_structuressubtitle;
      case "algorithms": return algorithms;
      case "algorithmssubtitle": return algorithmssubtitle;
      case "solid_principles": return solid_principles;
      case "solid_principlessubtitle": return solid_principlessubtitle;
      case "design_patterns": return design_patterns;
      case "design_patternssubtitle": return design_patternssubtitle;
      case "cubit": return cubit;
      case "cubitsubtitle": return cubitsubtitle;
      case "bloc": return bloc;
      case "blocsubtitle": return blocsubtitle;
      case "clean_architecture": return clean_architecture;
      case "clean_architecturesubtitle": return clean_architecturesubtitle;
      case "mvvm": return mvvm;
      case "mvvmsubtitle": return mvvmsubtitle;
      default: return "";
    }
  }
}

