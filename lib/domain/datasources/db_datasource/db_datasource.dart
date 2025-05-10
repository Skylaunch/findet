import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/domain/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class DBDatasource extends Injectable {
  Future<DateTime> getLastOperationTime();
  Future<List<FinancialOperationModel>> getFinancesData();
  Future<void> saveFinanceData(FinancialOperationModel model);
  Future<void> saveFinancesDataList(List<FinancialOperationModel> models);
  Future<List<String>> getPersonalCategories();
  Future<void> savePersonalCategory(String categoryTitle);
  Future<List<FinancialOperationModel>> getFinancesDataForDay(DateTime filteringTime);
  Future<UserModel?> getAuthorizedUser({required String login, required String password});
  Future<void> changeUserData({String? login, String? password, String? firstName, String? lastName});
}
