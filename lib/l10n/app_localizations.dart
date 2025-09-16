import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get about;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work Experience'**
  String get work;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contact;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Abdul Aziz'**
  String get heroTitle;

  /// No description provided for @mobileAppDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Developer'**
  String get mobileAppDeveloper;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'Building scalable, user-friendly mobile applications with Flutter, Firebase, and modern state management. Passionate about clean architecture, performance optimization, and delivering real-world solutions.'**
  String get heroDescription;

  /// No description provided for @cooperationRequest.
  ///
  /// In en, this message translates to:
  /// **'Cooperation Request'**
  String get cooperationRequest;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutTitle;

  /// No description provided for @aboutParagraph.
  ///
  /// In en, this message translates to:
  /// **'My journey into tech started with my Computer Science studies at Kafr El-Sheikh University, after transferring from Luxor University.Over the past years, I’ve gained hands-on experience through training with the Digital Egypt Pioneers Initiative (DEPI) and the Information Technology Institute (ITI), where I built real-world mobile apps using Flutter, Dart, Firebase, and REST APIs. I also worked with state management patterns like Cubit and Bloc, and focused on delivering clean, scalable, and maintainable code.Beyond coding, I value teamwork, communication, and problem-solving skills I strengthened while collaborating on projects and mentoring peers.What sets me apart? I don’t just build apps, I build experiences.'**
  String get aboutParagraph;

  /// No description provided for @softSkills.
  ///
  /// In en, this message translates to:
  /// **'Soft Skills'**
  String get softSkills;

  /// No description provided for @technicalSkills.
  ///
  /// In en, this message translates to:
  /// **'Technical Skills'**
  String get technicalSkills;

  /// No description provided for @teamwork.
  ///
  /// In en, this message translates to:
  /// **'Teamwork'**
  String get teamwork;

  /// No description provided for @communication.
  ///
  /// In en, this message translates to:
  /// **'Communication Skills'**
  String get communication;

  /// No description provided for @presentation.
  ///
  /// In en, this message translates to:
  /// **'Presentation'**
  String get presentation;

  /// No description provided for @time_management.
  ///
  /// In en, this message translates to:
  /// **'Time Management'**
  String get time_management;

  /// No description provided for @remote_collaboration.
  ///
  /// In en, this message translates to:
  /// **'Remote Collaboration'**
  String get remote_collaboration;

  /// No description provided for @adaptability.
  ///
  /// In en, this message translates to:
  /// **'Adaptability'**
  String get adaptability;

  /// No description provided for @team_leadership.
  ///
  /// In en, this message translates to:
  /// **'Team Leadership'**
  String get team_leadership;

  /// No description provided for @problem_solving.
  ///
  /// In en, this message translates to:
  /// **'Problem Solving'**
  String get problem_solving;

  /// No description provided for @critical_thinking.
  ///
  /// In en, this message translates to:
  /// **'Critical Thinking'**
  String get critical_thinking;

  /// No description provided for @self_learning.
  ///
  /// In en, this message translates to:
  /// **'Self-Learning'**
  String get self_learning;

  /// No description provided for @dart.
  ///
  /// In en, this message translates to:
  /// **'Dart'**
  String get dart;

  /// No description provided for @flutter.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get flutter;

  /// No description provided for @firebase.
  ///
  /// In en, this message translates to:
  /// **'Firebase'**
  String get firebase;

  /// No description provided for @cpp.
  ///
  /// In en, this message translates to:
  /// **'C++'**
  String get cpp;

  /// No description provided for @csharp.
  ///
  /// In en, this message translates to:
  /// **'C#'**
  String get csharp;

  /// No description provided for @python.
  ///
  /// In en, this message translates to:
  /// **'Python'**
  String get python;

  /// No description provided for @oop.
  ///
  /// In en, this message translates to:
  /// **'OOP'**
  String get oop;

  /// No description provided for @data_structures.
  ///
  /// In en, this message translates to:
  /// **'Data Structures'**
  String get data_structures;

  /// No description provided for @algorithms.
  ///
  /// In en, this message translates to:
  /// **'Algorithms'**
  String get algorithms;

  /// No description provided for @solid_principles.
  ///
  /// In en, this message translates to:
  /// **'SOLID Principles'**
  String get solid_principles;

  /// No description provided for @design_patterns.
  ///
  /// In en, this message translates to:
  /// **'Design Patterns'**
  String get design_patterns;

  /// No description provided for @cubit.
  ///
  /// In en, this message translates to:
  /// **'Cubit'**
  String get cubit;

  /// No description provided for @bloc.
  ///
  /// In en, this message translates to:
  /// **'Bloc'**
  String get bloc;

  /// No description provided for @clean_architecture.
  ///
  /// In en, this message translates to:
  /// **'Clean Architecture'**
  String get clean_architecture;

  /// No description provided for @mvvm.
  ///
  /// In en, this message translates to:
  /// **'MVVM'**
  String get mvvm;

  /// No description provided for @teamworksubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ability to collaborate effectively with a team to achieve goals'**
  String get teamworksubtitle;

  /// No description provided for @communicationsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Effective communication with colleagues and clients'**
  String get communicationsubtitle;

  /// No description provided for @presentationsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ability to present ideas clearly and persuasively'**
  String get presentationsubtitle;

  /// No description provided for @time_managementsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Organizing time to complete tasks efficiently'**
  String get time_managementsubtitle;

  /// No description provided for @remote_collaborationsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ability to work with remote teams'**
  String get remote_collaborationsubtitle;

  /// No description provided for @adaptabilitysubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quickly adapting to changes and new situations'**
  String get adaptabilitysubtitle;

  /// No description provided for @team_leadershipsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guiding and managing a team to achieve best performance'**
  String get team_leadershipsubtitle;

  /// No description provided for @problem_solvingsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Analyzing problems and finding effective solutions'**
  String get problem_solvingsubtitle;

  /// No description provided for @critical_thinkingsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Analyzing information to make informed decisions'**
  String get critical_thinkingsubtitle;

  /// No description provided for @self_learningsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ability to acquire new skills independently'**
  String get self_learningsubtitle;

  /// No description provided for @dartsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Proficient in Dart for building high-performance apps'**
  String get dartsubtitle;

  /// No description provided for @fluttersubtitle.
  ///
  /// In en, this message translates to:
  /// **'Developing mobile and web apps using Flutter'**
  String get fluttersubtitle;

  /// No description provided for @firebasesubtitle.
  ///
  /// In en, this message translates to:
  /// **'Working with Firebase database, authentication, and services'**
  String get firebasesubtitle;

  /// No description provided for @cppsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Proficient in C++ for object-oriented and structured programming'**
  String get cppsubtitle;

  /// No description provided for @csharpsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Developing applications using C# and .NET Framework'**
  String get csharpsubtitle;

  /// No description provided for @pythonsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Writing scripts and programs using Python'**
  String get pythonsubtitle;

  /// No description provided for @oopsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Designing software using Object-Oriented Programming principles'**
  String get oopsubtitle;

  /// No description provided for @data_structuressubtitle.
  ///
  /// In en, this message translates to:
  /// **'Organizing data efficiently for better program performance'**
  String get data_structuressubtitle;

  /// No description provided for @algorithmssubtitle.
  ///
  /// In en, this message translates to:
  /// **'Solving problems using efficient algorithms'**
  String get algorithmssubtitle;

  /// No description provided for @solid_principlessubtitle.
  ///
  /// In en, this message translates to:
  /// **'Writing maintainable and scalable code following SOLID principles'**
  String get solid_principlessubtitle;

  /// No description provided for @design_patternssubtitle.
  ///
  /// In en, this message translates to:
  /// **'Applying design patterns to improve code structure'**
  String get design_patternssubtitle;

  /// No description provided for @cubitsubtitle.
  ///
  /// In en, this message translates to:
  /// **'State management in Flutter using Cubit'**
  String get cubitsubtitle;

  /// No description provided for @blocsubtitle.
  ///
  /// In en, this message translates to:
  /// **'State management in Flutter using Bloc pattern'**
  String get blocsubtitle;

  /// No description provided for @clean_architecturesubtitle.
  ///
  /// In en, this message translates to:
  /// **'Designing applications in a clean and organized way'**
  String get clean_architecturesubtitle;

  /// No description provided for @mvvmsubtitle.
  ///
  /// In en, this message translates to:
  /// **'Using MVVM pattern to separate UI and logic'**
  String get mvvmsubtitle;

  /// No description provided for @deadbot_short.
  ///
  /// In en, this message translates to:
  /// **'AI app that answers your questions and solves problems, with free image uploads.'**
  String get deadbot_short;

  /// No description provided for @deadbot_long.
  ///
  /// In en, this message translates to:
  /// **'An advanced AI app using large language models (LLM) to provide accurate answers to your questions and solutions to your problems. The app features an easy-to-use interface, free image upload support, and cloud integration to ensure high performance and reliability.'**
  String get deadbot_long;

  /// No description provided for @k3_short.
  ///
  /// In en, this message translates to:
  /// **'App to calculate transport fares and split expenses accurately.'**
  String get k3_short;

  /// No description provided for @k3_long.
  ///
  /// In en, this message translates to:
  /// **'Khalyha Alena helps you calculate public transport fares among friends, records who paid what, and computes who owes or is owed money. It also provides efficient travel routes to organize daily expenses or group trips effectively.'**
  String get k3_long;

  /// No description provided for @tawseela_short.
  ///
  /// In en, this message translates to:
  /// **'Transport service for students living away, at affordable and comfortable prices.'**
  String get tawseela_short;

  /// No description provided for @tawseela_long.
  ///
  /// In en, this message translates to:
  /// **'Tawseela is an app designed to ease life for students living away from home in Egypt. It provides safe and comfortable transport between cities and governorates at reasonable prices, with the ability to track vehicles and book trips easily.'**
  String get tawseela_long;

  /// No description provided for @memomate_short.
  ///
  /// In en, this message translates to:
  /// **'App for safely and efficiently recording personal notes online.'**
  String get memomate_short;

  /// No description provided for @memomate_long.
  ///
  /// In en, this message translates to:
  /// **'Memomate is an app for recording personal notes online in a secure and organized way. You can write daily journals, record ideas, and keep important notes accessible anytime from any device.'**
  String get memomate_long;

  /// No description provided for @aboot__.
  ///
  /// In en, this message translates to:
  /// **'I\'m Ahmed Abdul Aziz and '**
  String get aboot__;

  /// No description provided for @aboot___.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get aboot___;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @luxor_university.
  ///
  /// In en, this message translates to:
  /// **'Luxor University'**
  String get luxor_university;

  /// No description provided for @faculty_computers_info.
  ///
  /// In en, this message translates to:
  /// **'Faculty of Computers and Information'**
  String get faculty_computers_info;

  /// No description provided for @date_oct2022_jun2023.
  ///
  /// In en, this message translates to:
  /// **'Oct 2022 - Jun 2023'**
  String get date_oct2022_jun2023;

  /// No description provided for @kfs_university.
  ///
  /// In en, this message translates to:
  /// **'Kafr El-Sheikh University'**
  String get kfs_university;

  /// No description provided for @cs_department.
  ///
  /// In en, this message translates to:
  /// **'CS Department'**
  String get cs_department;

  /// No description provided for @date_oct2023_present.
  ///
  /// In en, this message translates to:
  /// **'Oct 2023 - Present'**
  String get date_oct2023_present;

  /// No description provided for @iti.
  ///
  /// In en, this message translates to:
  /// **'Information Technology Institute'**
  String get iti;

  /// No description provided for @summer_training_flutter.
  ///
  /// In en, this message translates to:
  /// **'Summer Training - Flutter Track'**
  String get summer_training_flutter;

  /// No description provided for @tanta_branch.
  ///
  /// In en, this message translates to:
  /// **'Tanta Branch'**
  String get tanta_branch;

  /// No description provided for @date_jul2025_aug2025.
  ///
  /// In en, this message translates to:
  /// **'Jul 2025 - Aug 2025'**
  String get date_jul2025_aug2025;

  /// No description provided for @depi.
  ///
  /// In en, this message translates to:
  /// **'Digital Egypt Pioneers Initiative'**
  String get depi;

  /// No description provided for @flutter_track.
  ///
  /// In en, this message translates to:
  /// **'Flutter Track'**
  String get flutter_track;

  /// No description provided for @alexandria.
  ///
  /// In en, this message translates to:
  /// **'Alexandria'**
  String get alexandria;

  /// No description provided for @date_jul2025_present.
  ///
  /// In en, this message translates to:
  /// **'Jul 2025 - Present'**
  String get date_jul2025_present;

  /// No description provided for @view_my_cv.
  ///
  /// In en, this message translates to:
  /// **'View My CV'**
  String get view_my_cv;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// No description provided for @enterSubject.
  ///
  /// In en, this message translates to:
  /// **'Enter subject'**
  String get enterSubject;

  /// No description provided for @enterMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter your message'**
  String get enterMessage;

  /// No description provided for @messageSent.
  ///
  /// In en, this message translates to:
  /// **'Your message has been sent successfully'**
  String get messageSent;

  /// No description provided for @messageFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send message'**
  String get messageFailed;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'view'**
  String get view;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
