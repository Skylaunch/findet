import 'package:findet/data/themes/dark_theme_colors.dart';
import 'package:findet/data/themes/light_theme_colors.dart';
import 'package:findet/domain/themes/theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Эвент блока темизации
abstract class ThemeEvent {}

/// Эвент изменения темы
class ThemeChangedEvent extends ThemeEvent {}

/// Стейт блока темизации
abstract class ThemeState {
  ThemeColors get colors;
  bool get isDark;
}

/// Стейт тёмной темы
class DarkThemeState extends ThemeState {
  @override
  ThemeColors get colors => DarkThemeColors();

  @override
  bool get isDark => true;
}

/// Стейт светлой темы
class LightThemeState extends ThemeState {
  @override
  ThemeColors get colors => LightThemeColors();

  @override
  bool get isDark => false;
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState()) {
    on<ThemeChangedEvent>((event, emit) {
      emit(state.isDark ? LightThemeState() : DarkThemeState());
    });
  }
}
