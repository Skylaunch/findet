import 'package:findet/domain/datasources/db_datasource/db_datasource.dart';
import 'package:findet/domain/models/enum/currency_type.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/helpers/extensions.dart';
// import 'package:firebase_database/firebase_database.dart';

class DBDatasourceImpl extends DBDatasource {
  // final FirebaseDatabase database = FirebaseDatabase.instance;

  final mockFinanceOperationsData = [
    FinancialOperationModel(
      id: 1,
      subtractedValue: 50,
      currency: CurrencyType.dollar,
      category: 'Здоровье',
      time: DateTime.utc(2025, 2, 22, 20, 18, 04),
    ),
    FinancialOperationModel(
      id: 2,
      subtractedValue: 50,
      currency: CurrencyType.dollar,
      category: 'Еда',
      time: DateTime.utc(2025, 2, 22, 21, 18, 04),
    ),
    FinancialOperationModel(
      id: 3,
      subtractedValue: 50,
      currency: CurrencyType.dollar,
      category: 'Дом',
      time: DateTime.utc(2025, 2, 21, 20, 18, 04),
    ),
  ];

  @override
  Future<DateTime> getLastOperationTime() async {
    return mockFinanceOperationsData.last.time;
  }

  @override
  Future<List<FinancialOperationModel>> getFinancesData() async {
    // try {
    //   final snapshot = await database.ref('financialOperations').get();
    //   if (snapshot.exists) {
    //     final values = snapshot.value as List;
    //     List<FinancialOperationModel> financialOperations =
    //         List<FinancialOperationModel>.from(
    //       values.map(
    //         (json) => FinancialOperationModel.fromJson(json),
    //       ),
    //     ).toList();

    //     return financialOperations;
    //   }
    // } catch (e, s) {
    //   appLogger.e(
    //     'Ошибка во время получения финансовых операций',
    //     error: e,
    //     stackTrace: s,
    //   );
    // }

    // return [];
    return mockFinanceOperationsData;
  }

  @override
  Future<void> removeFinancesData(int id) async {
    // final financialOperationRef =
    //     FirebaseDatabase.instance.ref('financialOperations/$id');

    // await financialOperationRef.remove();
  }

  @override
  Future<List<FinancialOperationModel>> getFinancesDataForDay(DateTime filteringTime) async {
    return mockFinanceOperationsData.where((financeOperation) {
      return financeOperation.time.isEqual(filteringTime);
    }).toList();
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
