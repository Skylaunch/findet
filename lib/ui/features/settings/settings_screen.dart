import 'package:findet/helpers/extensions.dart';
import 'package:findet/ui/common/default_app_bar.dart';
import 'package:findet/ui/features/settings/widgets/profile_widget.dart';
import 'package:findet/ui/features/settings/widgets/settings_menu.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(title: 'Settings'),
        body: Center(
          child: Column(
            children: [
              ProfileWidget(
                onTap: () {
                  context.go('${Routes.settings}/${Routes.profile}');
                },
              ),
              const SizedBox(height: 26),
              SettingsMenu(
                onLocalizationNavigate: () {
                  context.go('${Routes.settings}/${Routes.localizations}');
                },
                onThemeNavigate: () {
                  context.go('${Routes.settings}/${Routes.theme}');
                },
                onUserCategoriesNavigate: () {
                  context.go('${Routes.settings}/${Routes.userCategories}');
                },
              ),
            ],
          ),
        ),
      ).padding(edgeInsets: const EdgeInsets.all(14)),
    );
  }
}
