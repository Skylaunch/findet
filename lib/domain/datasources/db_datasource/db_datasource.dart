import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:injectable/injectable.dart';

abstract class DBDatasource extends Injectable {
  Future<DateTime> getLastOperationTime();
  Future<List<FinancialOperationModel>> getFinancesData();
  Future<void> saveFinanceData(FinancialOperationModel model);
  Future<void> saveFinancesDataList(List<FinancialOperationModel> models);
  Future<void> removeFinancesData(int id);
  Future<List<FinancialOperationModel>> getFinancesDataForDay(DateTime filteringTime);
}
