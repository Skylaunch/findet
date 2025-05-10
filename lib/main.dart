import 'package:findet/blocs/blocs.dart';
import 'package:findet/blocs/global/localization_bloc.dart';
import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/data/datasources_impl/db_datasource_impl/db_datasource_impl.dart';
import 'package:findet/data/services_impl/auth_service_impl.dart';
import 'package:findet/data/services_impl/personal_categories_service_impl.dart';
import 'package:findet/data/services_impl/toasts_service_impl.dart';
import 'package:findet/firebase_options.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:findet/ui/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  // Пример использования
  // MainApp.setLocale(context, const Locale('en'));
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
    state?.changeLanguage(newLocale);
  }
}

class _MainAppState extends State<MainApp> {
  changeLanguage(Locale locale) {
    setState(() {});
  }

  void setupDI() {
    toastService = ToastsServiceImpl();
    datasource = DBDatasourceImpl();
    // Инициализация происходит в AuthBloc-е
    authService = AuthServiceImpl();
    personalCategoriesService = PersonalCategoriesServiceImpl();
  }

  @override
  void initState() {
    super.initState();
    setupDI();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp.router(
          locale: context.watch<LocalizationBloc>().state.isRussian
              ? const Locale('ru')
              : const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Inter',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Inter',
          ),
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        ),
      ),
    );
  }
}
