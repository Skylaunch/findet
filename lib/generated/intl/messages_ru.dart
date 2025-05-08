// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(newCategory) => "Категория ${newCategory} создана";

  static String m1(selectedLanguage) => "Текущий язык: ${selectedLanguage}";

  static String m2(selectedTheme) => "Текущая тема: ${selectedTheme}";

  static String m3(firstName) => "Добро пожаловать, ${firstName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_category_title": MessageLookupByLibrary.simpleMessage(
      "Добавить категорию",
    ),
    "add_new_category_title": MessageLookupByLibrary.simpleMessage(
      "Добавить новую категорию",
    ),
    "add_text": MessageLookupByLibrary.simpleMessage("Добавить"),
    "category_was_created_text": m0,
    "continue_title": MessageLookupByLibrary.simpleMessage("Далее"),
    "current_language_title": m1,
    "current_theme_title": m2,
    "dark_theme_title": MessageLookupByLibrary.simpleMessage("Темная"),
    "data_was_updated_title": MessageLookupByLibrary.simpleMessage(
      "Данные обновлены",
    ),
    "diagram_tab": MessageLookupByLibrary.simpleMessage("диаграмма"),
    "email_title": MessageLookupByLibrary.simpleMessage("Email"),
    "english_language_title": MessageLookupByLibrary.simpleMessage(
      "Английский",
    ),
    "fill_required_fields_error": MessageLookupByLibrary.simpleMessage(
      "Заполните необходимое поле",
    ),
    "firstname_title": MessageLookupByLibrary.simpleMessage("Имя"),
    "forgot_password_question": MessageLookupByLibrary.simpleMessage(
      "Забыли пароль?",
    ),
    "home_tab": MessageLookupByLibrary.simpleMessage("дом"),
    "last_operation_time_fetching_error": MessageLookupByLibrary.simpleMessage(
      "Ошибка во время получения времени последней финансовой операции",
    ),
    "lastname_title": MessageLookupByLibrary.simpleMessage("Фамилия"),
    "light_theme_title": MessageLookupByLibrary.simpleMessage("Светлая"),
    "localization": MessageLookupByLibrary.simpleMessage("Локализация"),
    "log_in": MessageLookupByLibrary.simpleMessage("Войти"),
    "log_out": MessageLookupByLibrary.simpleMessage("Выйти"),
    "new_category_title": MessageLookupByLibrary.simpleMessage(
      "Новая категория",
    ),
    "no_account_question": MessageLookupByLibrary.simpleMessage(
      "Нет аккаунта?",
    ),
    "password_title": MessageLookupByLibrary.simpleMessage("Пароль"),
    "personal_categories_default_selected_text":
        MessageLookupByLibrary.simpleMessage(
          "Добавьте свои собственные категории для удобства",
        ),
    "personal_categories_title": MessageLookupByLibrary.simpleMessage(
      "Персональные категории",
    ),
    "profile_page_title": MessageLookupByLibrary.simpleMessage(
      "Страница профиля",
    ),
    "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "russian_language_title": MessageLookupByLibrary.simpleMessage("Русский"),
    "settings_tab": MessageLookupByLibrary.simpleMessage("настройки"),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "themization": MessageLookupByLibrary.simpleMessage("Темизация"),
    "uncorrect_login_or_password_error": MessageLookupByLibrary.simpleMessage(
      "Произошла ошибка :(\nВы ввели неверный логин или пароль",
    ),
    "uncorrect_selected_language_error": MessageLookupByLibrary.simpleMessage(
      "Данного языка в приложении пока нет",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Обновить"),
    "weekday_to_string_error": MessageLookupByLibrary.simpleMessage(
      "Ошибка при преобразовании дня недели в строку",
    ),
    "welcome": m3,
    "welcome_to_app": MessageLookupByLibrary.simpleMessage(
      "Добро пожаловать в Findet",
    ),
    "welcome_to_app_description": MessageLookupByLibrary.simpleMessage(
      "Здесь ты сможешь отслеживать\nсвои финансы",
    ),
    "your_expenses_title": MessageLookupByLibrary.simpleMessage("Ваши расходы"),
    "your_profile_title": MessageLookupByLibrary.simpleMessage("Ваш профиль"),
    "zero_expenses_text": MessageLookupByLibrary.simpleMessage(
      "В этот день расходов не наблюдается ☺👍",
    ),
    "zero_filled_fields_text": MessageLookupByLibrary.simpleMessage(
      "Необходимо заполнить хотя бы\nодно поле",
    ),
  };
}
