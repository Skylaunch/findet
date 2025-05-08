import 'package:flutter_bloc/flutter_bloc.dart';

/// Эвент блока локализации
abstract class LocalizationEvent {}

/// Эвент изменения локализации
class LocalizationChangeEvent extends LocalizationEvent {
  final bool isRussian;

  LocalizationChangeEvent({required this.isRussian});
}

/// Стейт блока локализации
abstract class LocalizationState {
  bool get isRussian;
}

/// Стейт российской локализации
class RuLocalizationState extends LocalizationState {
  @override
  bool get isRussian => true;
}

/// Стейт английской локализации
class EngLocalizationState extends LocalizationState {
  @override
  bool get isRussian => false;
}

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(EngLocalizationState()) {
    on<LocalizationChangeEvent>((event, emit) {
      if (event.isRussian) {
        emit(RuLocalizationState());
      } else {
        emit(EngLocalizationState());
      }
    });
  }
}
