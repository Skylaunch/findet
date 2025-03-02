import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findet/domain/base/global_data.dart';
import 'package:findet/domain/datasources/db_datasource/db_datasource.dart';
import 'package:findet/domain/models/financial_operation_model.dart';

class DBDatasourceImpl extends DBDatasource {
  final database = FirebaseFirestore.instance;

  late final financialOperationsReference = database.collection("financialOperations");

  @override
  Future<DateTime> getLastOperationTime() async {
    try {
      final lastOperationTimeAsString = await financialOperationsReference
          .orderBy('time', descending: true)
          .limit(1)
          .get()
          .then((event) => event.docs.first.data()['time']);

      return DateTime.parse(lastOperationTimeAsString);
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время получения времени последней финансовой операции',
        error: e,
        stackTrace: s,
      );
    }

    throw 'Ошибка во время получения финансовых операций';
  }

  @override
  Future<List<FinancialOperationModel>> getFinancesData() async {
    try {
      final financialOperations = <FinancialOperationModel>[];
      await financialOperationsReference.get().then((event) {
        for (var doc in event.docs) {
          final financialOperationJson = doc.data();
          financialOperations.add(FinancialOperationModel.fromJson(financialOperationJson));
        }
      });
      return financialOperations;
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время получения финансовых операций',
        error: e,
        stackTrace: s,
      );
    }

    return [];
  }

  @override
  Future<void> removeFinancesData(int id) async {
    // final financialOperationRef =
    //     FirebaseDatabase.instance.ref('financialOperations/$id');

    // await financialOperationRef.remove();
  }

  @override
  Future<List<FinancialOperationModel>> getFinancesDataForDay(DateTime filteringTime) async {
    try {
      final filteredFinancialOperations = <FinancialOperationModel>[];

      await financialOperationsReference.where('time', isEqualTo: filteringTime.toIso8601String()).get().then((event) {
        for (var doc in event.docs) {
          final financialOperationJson = doc.data();
          filteredFinancialOperations.add(FinancialOperationModel.fromJson(financialOperationJson));
        }
      });

      return filteredFinancialOperations;
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время получения финансовых операций за конкретный день',
        error: e,
        stackTrace: s,
      );
    }

    return [];
  }

  @override
  Future<void> saveFinanceData(FinancialOperationModel model) async {
    // try {
    //   final financialOperationRef =
    //       FirebaseDatabase.instance.ref('financialOperations/${model.id}');
    //   financialOperationRef.set(model.toJson());
    // } catch (e, s) {
    //   appLogger.e(
    //     'Ошибка во время добавления финансовой операции',
    //     error: e,
    //     stackTrace: s,
    //   );
    // }
  }

  @override
  Future<void> saveFinancesDataList(models) async {
    for (final model in models) {
      await saveFinanceData(model);
    }
  }
}
