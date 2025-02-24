import 'package:findet/data/datasources_impl/db_datasource_impl/db_datasource_impl.dart';
import 'package:findet/domain/datasources/db_datasource/db_datasource.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
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
    // Переделать через DI
    DBDatasource datasource = DBDatasourceImpl();

    on<DiagramStartLoadingEvent>((event, emit) async {
      final lastOperationTime = await datasource.getLastOperationTime();

      add(
        DiagramDateFilteringEvent(
          filteringTime: lastOperationTime,
        ),
      );
    });

    on<DiagramDateFilteringEvent>((event, emit) async {
      final filteredFinancialOperations = await datasource.getFinancesDataForDay(event.filteringTime);

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

  String getDayFirstLetters(DateTime dateFilterTime) {
    switch (dateFilterTime.weekday) {
      case 1:
        return 'MO';
      case 2:
        return 'TU';
      case 3:
        return 'WE';
      case 4:
        return 'TH';
      case 5:
        return 'FR';
      case 6:
        return 'SA';
      case 7:
        return 'SU';
      default:
        throw ('Ошибка при преобразовании дня недели в строку');
    }
  }
}
