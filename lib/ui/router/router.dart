import 'package:findet/ui/features/diagram/diagram_screen.dart';
import 'package:findet/ui/features/home/home_screen.dart';
import 'package:findet/ui/features/localizations/localizations_screen.dart';
import 'package:findet/ui/features/settings/settings_screen.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:findet/ui/ui_app/app_layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [
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
                  )
                ],
              ),
            ],
          ),
        ]),
  ],
);
