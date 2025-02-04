import 'package:findet/assets/themes/colors.dart';
import 'package:findet/assets/themes/dark_colors.dart';
import 'package:findet/assets/themes/white_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Эвент блока темизации
abstract class ThemeEvent {}

/// Эвент изменения темы
class ThemeChangedEvent extends ThemeEvent {}

/// Стейт блока темизации
abstract class ThemeState {
  bool get isDark;

  ColorStyle get colorStyle;
}

/// Стейт тёмной темы
class DarkThemeState extends ThemeState {
  @override
  bool get isDark => true;

  @override
  ColorStyle get colorStyle => DarkColorStyle();
}

/// Стейт светлой темы
class WhiteThemeState extends ThemeState {
  @override
  bool get isDark => false;

  @override
  ColorStyle get colorStyle => WhiteColorStyle();
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState()) {
    on<ThemeChangedEvent>((event, emit) {
      emit(state.isDark ? WhiteThemeState() : DarkThemeState());
    });
  }
}
