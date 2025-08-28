import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false); // false = light, true = dark

  void toggleTheme() => emit(!state);
}