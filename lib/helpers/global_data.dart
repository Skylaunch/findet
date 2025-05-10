import 'package:findet/domain/datasources/db_datasource/db_datasource.dart';
import 'package:findet/domain/services/auth_service.dart';
import 'package:findet/domain/services/personal_categories_service.dart';
import 'package:findet/domain/services/toasts_service.dart';

// Services
late ToastsService toastService;
late AuthService authService;
late PersonalCategoriesService personalCategoriesService;

// Datasources
late DBDatasource datasource;
