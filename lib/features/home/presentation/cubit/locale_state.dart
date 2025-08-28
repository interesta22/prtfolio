part of 'locale_cubit.dart';

@immutable
sealed class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

final class LocaleInitial extends LocaleState {
  const LocaleInitial() : super(const Locale('en'));
}

class ChangeLocale extends LocaleState {
  const ChangeLocale(super.locale);
}