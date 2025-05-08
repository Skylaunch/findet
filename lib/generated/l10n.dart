// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `home`
  String get home_tab {
    return Intl.message('home', name: 'home_tab', desc: '', args: []);
  }

  /// `diagram`
  String get diagram_tab {
    return Intl.message('diagram', name: 'diagram_tab', desc: '', args: []);
  }

  /// `settings`
  String get settings_tab {
    return Intl.message('settings', name: 'settings_tab', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Localization`
  String get localization {
    return Intl.message(
      'Localization',
      name: 'localization',
      desc: '',
      args: [],
    );
  }

  /// `Your profile page`
  String get profile_page_title {
    return Intl.message(
      'Your profile page',
      name: 'profile_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark_theme_title {
    return Intl.message('Dark', name: 'dark_theme_title', desc: '', args: []);
  }

  /// `Light`
  String get light_theme_title {
    return Intl.message('Light', name: 'light_theme_title', desc: '', args: []);
  }

  /// `Russian`
  String get russian_language_title {
    return Intl.message(
      'Russian',
      name: 'russian_language_title',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english_language_title {
    return Intl.message(
      'English',
      name: 'english_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Personal categories`
  String get personal_categories_title {
    return Intl.message(
      'Personal categories',
      name: 'personal_categories_title',
      desc: '',
      args: [],
    );
  }

  /// `Add your own categories for convenience`
  String get personal_categories_default_selected_text {
    return Intl.message(
      'Add your own categories for convenience',
      name: 'personal_categories_default_selected_text',
      desc: '',
      args: [],
    );
  }

  /// `Selected language: {selectedLanguage}`
  String current_language_title(Object selectedLanguage) {
    return Intl.message(
      'Selected language: $selectedLanguage',
      name: 'current_language_title',
      desc: '',
      args: [selectedLanguage],
    );
  }

  /// `Log in`
  String get log_in {
    return Intl.message('Log in', name: 'log_in', desc: '', args: []);
  }

  /// `There is no account?`
  String get no_account_question {
    return Intl.message(
      'There is no account?',
      name: 'no_account_question',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot_password_question {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_password_question',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_title {
    return Intl.message('Password', name: 'password_title', desc: '', args: []);
  }

  /// `Email`
  String get email_title {
    return Intl.message('Email', name: 'email_title', desc: '', args: []);
  }

  /// `Your expenses`
  String get your_expenses_title {
    return Intl.message(
      'Your expenses',
      name: 'your_expenses_title',
      desc: '',
      args: [],
    );
  }

  /// `There are no expenses on this day ☺👍`
  String get zero_expenses_text {
    return Intl.message(
      'There are no expenses on this day ☺👍',
      name: 'zero_expenses_text',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get log_out {
    return Intl.message('Log out', name: 'log_out', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `The data has been updated`
  String get data_was_updated_title {
    return Intl.message(
      'The data has been updated',
      name: 'data_was_updated_title',
      desc: '',
      args: [],
    );
  }

  /// `It is necessary to fill in at least\none field`
  String get zero_filled_fields_text {
    return Intl.message(
      'It is necessary to fill in at least\none field',
      name: 'zero_filled_fields_text',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get lastname_title {
    return Intl.message('Surname', name: 'lastname_title', desc: '', args: []);
  }

  /// `Name`
  String get firstname_title {
    return Intl.message('Name', name: 'firstname_title', desc: '', args: []);
  }

  /// `Your profile`
  String get your_profile_title {
    return Intl.message(
      'Your profile',
      name: 'your_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {firstName}`
  String welcome(Object firstName) {
    return Intl.message(
      'Welcome, $firstName',
      name: 'welcome',
      desc: '',
      args: [firstName],
    );
  }

  /// `An error occurred:(\nyou entered an incorrect username or password`
  String get uncorrect_login_or_password_error {
    return Intl.message(
      'An error occurred:(\nyou entered an incorrect username or password',
      name: 'uncorrect_login_or_password_error',
      desc: '',
      args: [],
    );
  }

  /// `This language is not yet available in the application`
  String get uncorrect_selected_language_error {
    return Intl.message(
      'This language is not yet available in the application',
      name: 'uncorrect_selected_language_error',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Findet`
  String get welcome_to_app {
    return Intl.message(
      'Welcome to Findet',
      name: 'welcome_to_app',
      desc: '',
      args: [],
    );
  }

  /// `Here you can track\nyour finances`
  String get welcome_to_app_description {
    return Intl.message(
      'Here you can track\nyour finances',
      name: 'welcome_to_app_description',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_title {
    return Intl.message('Continue', name: 'continue_title', desc: '', args: []);
  }

  /// `Add new category`
  String get add_new_category_title {
    return Intl.message(
      'Add new category',
      name: 'add_new_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add_text {
    return Intl.message('Add', name: 'add_text', desc: '', args: []);
  }

  /// `Fill in the required field`
  String get fill_required_fields_error {
    return Intl.message(
      'Fill in the required field',
      name: 'fill_required_fields_error',
      desc: '',
      args: [],
    );
  }

  /// `Category {newCategory} was created`
  String category_was_created_text(Object newCategory) {
    return Intl.message(
      'Category $newCategory was created',
      name: 'category_was_created_text',
      desc: '',
      args: [newCategory],
    );
  }

  /// `New category`
  String get new_category_title {
    return Intl.message(
      'New category',
      name: 'new_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get add_category_title {
    return Intl.message(
      'Add category',
      name: 'add_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Error when converting the day of the week to a string`
  String get weekday_to_string_error {
    return Intl.message(
      'Error when converting the day of the week to a string',
      name: 'weekday_to_string_error',
      desc: '',
      args: [],
    );
  }

  /// `Error when getting the time of the last financial transaction`
  String get last_operation_time_fetching_error {
    return Intl.message(
      'Error when getting the time of the last financial transaction',
      name: 'last_operation_time_fetching_error',
      desc: '',
      args: [],
    );
  }

  /// `Selected theme: {selectedTheme}`
  String current_theme_title(Object selectedTheme) {
    return Intl.message(
      'Selected theme: $selectedTheme',
      name: 'current_theme_title',
      desc: '',
      args: [selectedTheme],
    );
  }

  /// `Themization`
  String get themization {
    return Intl.message('Themization', name: 'themization', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
