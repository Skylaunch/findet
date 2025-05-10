import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Эвент блока работы с диаграммами
abstract class DiagramEvent {}

/// Эвент начала загрузки диаграммы
class DiagramStartLoadingEvent extends DiagramEvent {}

/// Эвент фильтрации списка операций по конкретному дню
class DiagramDateFilteringEvent extends DiagramEvent {
  DiagramDateFilteringEvent({required this.filteringTime});

  final DateTime filteringTime;
}

/// Эвент окончания загрузки диаграммы
class DiagramLoadedEvent extends DiagramEvent {
  DiagramLoadedEvent({
    required this.filteringTime,
    required this.financialOperations,
  });

  final List<FinancialOperationModel> financialOperations;

  final DateTime filteringTime;
}

/// Стейт блока работы с диаграммами
abstract class DiagramState {}

/// Стейт загрузки
class DiagramLoadingState extends DiagramState {}

/// Стейт загруженных данных
class DiagramLoadedState extends DiagramState {
  DiagramLoadedState({
    required this.financialOperations,
    required this.filteringTime,
  });

  final List<FinancialOperationModel> financialOperations;
  final DateTime filteringTime;
}

class DiagramBloc extends Bloc<DiagramEvent, DiagramState> {
  DiagramBloc() : super(DiagramLoadingState()) {
    on<DiagramStartLoadingEvent>((event, emit) async {
      final lastOperationTime = await datasource.getLastOperationTime();

      add(
        DiagramDateFilteringEvent(
          filteringTime: lastOperationTime,
        ),
      );
    });

    on<DiagramDateFilteringEvent>((event, emit) async {
      final filteredFinancialOperations =
          await datasource.getFinancesDataForDay(event.filteringTime);

      add(
        DiagramLoadedEvent(
          financialOperations: filteredFinancialOperations,
          filteringTime: event.filteringTime,
        ),
      );
    });

    on<DiagramLoadedEvent>(
      (event, emit) {
        emit(
          DiagramLoadedState(
            financialOperations: event.financialOperations,
            filteringTime: event.filteringTime,
          ),
        );
      },
    );
  }

  String getDayFirstLetters(DateTime dateFilterTime, BuildContext context) {
    switch (dateFilterTime.weekday) {
      case 1:
        return S.of(context).short_monday;
      case 2:
        return S.of(context).short_tuesday;
      case 3:
        return S.of(context).short_wednesday;
      case 4:
        return S.of(context).short_thursday;
      case 5:
        return S.of(context).short_friday;
      case 6:
        return S.of(context).short_saturday;
      case 7:
        return S.of(context).short_sunday;
      default:
        throw (S.of(context).weekday_to_string_error);
    }
  }
}
