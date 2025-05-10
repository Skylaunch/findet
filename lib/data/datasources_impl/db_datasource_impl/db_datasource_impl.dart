import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findet/domain/base/global_data.dart';
import 'package:findet/domain/datasources/db_datasource/db_datasource.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/domain/models/user_model.dart';
import 'package:findet/helpers/global_data.dart';

class DBDatasourceImpl extends DBDatasource {
  final database = FirebaseFirestore.instance;

  late final usersReference = database.collection('users');

  @override
  Future<DateTime> getLastOperationTime() async {
    try {
      final financialOperationsReference = getFinancialOperationsReference();

      final lastOperationTimeAsString = await financialOperationsReference
          .orderBy('time', descending: true)
          .limit(1)
          .get()
          .then((event) => event.docs.firstOrNull?.data()['time']);

      return lastOperationTimeAsString != null
          ? DateTime.parse(lastOperationTimeAsString)
          : DateTime.now();
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
  Future<List<String>> getPersonalCategories() async {
    try {
      final List<String> personalCategories = [];
      final personalCategoriesReference = getPersonalCategoriesReference();

      final event = await personalCategoriesReference.get();

      for (var doc in event.docs) {
        final personalCategoryJson = doc.data();
        if (personalCategoryJson['title'] != null) {
          personalCategories.add(personalCategoryJson['title']);
        }
      }

      return personalCategories;
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время получения пользовательских категорий',
        error: e,
        stackTrace: s,
      );
    }

    return [];
  }

  @override
  Future<void> savePersonalCategory(String categoryTitle) async {
    try {
      final financialOperationsReference = getPersonalCategoriesReference();

      financialOperationsReference.add({'title': categoryTitle});
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время добавления пользовательской категории',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<FinancialOperationModel>> getFinancesData() async {
    try {
      final List<FinancialOperationModel> financialOperations = [];
      final financialOperationsReference = getFinancialOperationsReference();

      final event = await financialOperationsReference.get();

      for (var doc in event.docs) {
        final financialOperationJson = doc.data();
        financialOperations
            .add(FinancialOperationModel.fromJson(financialOperationJson));
      }

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
  Future<List<FinancialOperationModel>> getFinancesDataForDay(
      DateTime filteringTime) async {
    try {
      final filteredFinancialOperations = <FinancialOperationModel>[];
      final financialOperationsReference = getFinancialOperationsReference();

      await financialOperationsReference
          .where('time', isEqualTo: filteringTime.toIso8601String())
          .get()
          .then((event) {
        for (var doc in event.docs) {
          final financialOperationJson = doc.data();
          filteredFinancialOperations
              .add(FinancialOperationModel.fromJson(financialOperationJson));
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
    try {
      final financialOperationsReference = getFinancialOperationsReference();

      financialOperationsReference.add(model.toJson());
    } catch (e, s) {
      appLogger.e(
        'Ошибка во время добавления финансовой операции',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> saveFinancesDataList(models) async {
    for (final model in models) {
      await saveFinanceData(model);
    }
  }

  @override
  Future<UserModel?> getAuthorizedUser(
      {required String login, required String password}) async {
    final event = await usersReference.get();

    for (final doc in event.docs) {
      final userJson = doc.data();
      if (userJson['email'] == login && userJson['password'] == password) {
        return UserModel.fromJson(userJson, doc.id);
      }
    }

    return null;
  }

  CollectionReference<Map<String, dynamic>> getFinancialOperationsReference() {
    final token = authService.getToken();
    if (token == null) {
      throw Exception('Токена нет во время операции с базой данных');
    }

    final user = usersReference.doc(token);
    return user.collection('financialOperations');
  }

  CollectionReference<Map<String, dynamic>> getPersonalCategoriesReference() {
    final token = authService.getToken();
    if (token == null) {
      throw Exception('Токена нет во время операции с базой данных');
    }

    final user = usersReference.doc(token);
    return user.collection('custom_categories');
  }

  @override
  Future<void> changeUserData(
      {String? login,
      String? password,
      String? firstName,
      String? lastName}) async {
    final token = authService.getToken();
    if (token == null) {
      throw Exception('Токена нет во время операции с базой данных');
    }

    final user = usersReference.doc(token);
    final userData = (await user.get()).data();
    if (userData != null) {
      final newUser = UserModel(
        id: user.id,
        firstName:
            firstName?.isNotEmpty ?? false ? firstName : userData['firstname'],
        lastName:
            lastName?.isNotEmpty ?? false ? lastName : userData['lastname'],
        email: login?.isNotEmpty ?? false ? login : userData['email'],
        password:
            password?.isNotEmpty ?? false ? password : userData['password'],
      );

      user.set(newUser.toJson());
    }
  }
}
