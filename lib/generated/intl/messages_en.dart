// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(newCategory) => "Category ${newCategory} was created";

  static String m1(selectedLanguage) =>
      "Selected language: ${selectedLanguage}";

  static String m2(selectedTheme) => "Selected theme: ${selectedTheme}";

  static String m3(firstName) => "Welcome, ${firstName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_category_title": MessageLookupByLibrary.simpleMessage("Add category"),
    "add_new_category_title": MessageLookupByLibrary.simpleMessage(
      "Add new category",
    ),
    "add_text": MessageLookupByLibrary.simpleMessage("Add"),
    "category_was_created_text": m0,
    "continue_title": MessageLookupByLibrary.simpleMessage("Continue"),
    "current_language_title": m1,
    "current_theme_title": m2,
    "dark_theme_title": MessageLookupByLibrary.simpleMessage("Dark"),
    "data_was_updated_title": MessageLookupByLibrary.simpleMessage(
      "The data has been updated",
    ),
    "diagram_tab": MessageLookupByLibrary.simpleMessage("diagram"),
    "email_title": MessageLookupByLibrary.simpleMessage("Email"),
    "english_language_title": MessageLookupByLibrary.simpleMessage("English"),
    "fill_required_fields_error": MessageLookupByLibrary.simpleMessage(
      "Fill in the required field",
    ),
    "firstname_title": MessageLookupByLibrary.simpleMessage("Name"),
    "forgot_password_question": MessageLookupByLibrary.simpleMessage(
      "Forgot your password?",
    ),
    "home_tab": MessageLookupByLibrary.simpleMessage("home"),
    "last_operation_time_fetching_error": MessageLookupByLibrary.simpleMessage(
      "Error when getting the time of the last financial transaction",
    ),
    "lastname_title": MessageLookupByLibrary.simpleMessage("Surname"),
    "light_theme_title": MessageLookupByLibrary.simpleMessage("Light"),
    "localization": MessageLookupByLibrary.simpleMessage("Localization"),
    "log_in": MessageLookupByLibrary.simpleMessage("Log in"),
    "log_out": MessageLookupByLibrary.simpleMessage("Log out"),
    "new_category_title": MessageLookupByLibrary.simpleMessage("New category"),
    "no_account_question": MessageLookupByLibrary.simpleMessage(
      "There is no account?",
    ),
    "password_title": MessageLookupByLibrary.simpleMessage("Password"),
    "personal_categories_default_selected_text":
        MessageLookupByLibrary.simpleMessage(
          "Add your own categories for convenience",
        ),
    "personal_categories_title": MessageLookupByLibrary.simpleMessage(
      "Personal categories",
    ),
    "profile_page_title": MessageLookupByLibrary.simpleMessage(
      "Your profile page",
    ),
    "registration": MessageLookupByLibrary.simpleMessage("Registration"),
    "russian_language_title": MessageLookupByLibrary.simpleMessage("Russian"),
    "settings_tab": MessageLookupByLibrary.simpleMessage("settings"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themization": MessageLookupByLibrary.simpleMessage("Themization"),
    "uncorrect_login_or_password_error": MessageLookupByLibrary.simpleMessage(
      "An error occurred:(\nyou entered an incorrect username or password",
    ),
    "uncorrect_selected_language_error": MessageLookupByLibrary.simpleMessage(
      "This language is not yet available in the application",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "weekday_to_string_error": MessageLookupByLibrary.simpleMessage(
      "Error when converting the day of the week to a string",
    ),
    "welcome": m3,
    "welcome_to_app": MessageLookupByLibrary.simpleMessage("Welcome to Findet"),
    "welcome_to_app_description": MessageLookupByLibrary.simpleMessage(
      "Here you can track\nyour finances",
    ),
    "your_expenses_title": MessageLookupByLibrary.simpleMessage(
      "Your expenses",
    ),
    "your_profile_title": MessageLookupByLibrary.simpleMessage("Your profile"),
    "zero_expenses_text": MessageLookupByLibrary.simpleMessage(
      "There are no expenses on this day ☺👍",
    ),
    "zero_filled_fields_text": MessageLookupByLibrary.simpleMessage(
      "It is necessary to fill in at least\none field",
    ),
  };
}
