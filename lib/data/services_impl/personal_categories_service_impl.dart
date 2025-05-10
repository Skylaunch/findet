import 'package:findet/domain/services/personal_categories_service.dart';
import 'package:findet/helpers/global_data.dart';

class PersonalCategoriesServiceImpl extends PersonalCategoriesService {
  @override
  Future<List<String>> getPersonalCategories() =>
      datasource.getPersonalCategories();

  @override
  Future<void> savePersonalCategory(String categoryTitle) async {
    datasource.savePersonalCategory(categoryTitle);

    notifyListeners();
  }
}
