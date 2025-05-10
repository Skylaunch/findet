import 'package:flutter/widgets.dart';

abstract class PersonalCategoriesService with ChangeNotifier {
  Future<List<String>> getPersonalCategories();
  Future<void> savePersonalCategory(String categoryTitle);
}
