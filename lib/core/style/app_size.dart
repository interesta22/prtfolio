class Insets {
  static const double maxWidth = 1280.0;
  static double get xs => 4.0;
  static double get med => 12.0;
  static double get xl => 24.0;
  static double get xxl => 48.0;
  static double get xxxl => 80.0;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
}

class LargeAppInsets implements AppInsets {
  @override
  double get padding => 90.0;

  @override
  double get appBarHeight => 64.0;
}

class SmallAppInsets implements AppInsets {
  @override
  double get padding => 16.0;

  @override
  double get appBarHeight => 56.0;
}
