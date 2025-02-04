import 'package:flutter_bloc/flutter_bloc.dart';

/// Эвент блока темизации
abstract class ThemeEvent {}

/// Эвент изменения темы
class ThemeChangedEvent extends ThemeEvent {}

/// Стейт блока темизации
abstract class ThemeState {
  bool get isDark;
}

/// Стейт тёмной темы
class DarkThemeState extends ThemeState {
  @override
  bool get isDark => true;
}

/// Стейт светлой темы
class WhiteThemeState extends ThemeState {
  @override
  bool get isDark => false;
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState()) {
    on<ThemeChangedEvent>((event, emit) {
      emit(state.isDark ? WhiteThemeState() : DarkThemeState());
    });
  }
}
