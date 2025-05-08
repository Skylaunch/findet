import 'package:findet/ui/features/auth/auth_screen.dart';
import 'package:findet/ui/features/diagram/diagram_screen.dart';
import 'package:findet/ui/features/home/home_screen.dart';
import 'package:findet/ui/features/localizations/localizations_screen.dart';
import 'package:findet/ui/features/profile/profile_screen.dart';
import 'package:findet/ui/features/settings/settings_screen.dart';
import 'package:findet/ui/features/splash/splash_screen.dart';
import 'package:findet/ui/features/theme/theme_screen.dart';
import 'package:findet/ui/features/user_categories/user_categories_screen.dart';
import 'package:findet/ui/features/welcome/welcome_screen.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:findet/ui/ui_app/app_layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppLayoutScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.diagram,
                builder: (context, state) => const DiagramScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settings,
                builder: (context, state) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: Routes.localizations,
                    builder: (context, state) => const LocalizationsScreen(),
                  ),
                  GoRoute(
                    path: Routes.theme,
                    builder: (context, state) => const ThemeScreen(),
                  ),
                  GoRoute(
                    path: Routes.userCategories,
                    builder: (context, state) => const UserCategoriesScreen(),
                  ),
                  GoRoute(
                    path: Routes.profile,
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ],
              ),
            ],
          ),
        ]),
  ],
);
