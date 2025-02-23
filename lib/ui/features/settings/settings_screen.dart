import 'package:findet/helpers/extensions.dart';
import 'package:findet/ui/features/settings/widgets/settings_menu.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SettingsMenu(
                onLocalizationsNavigate: () {
                  context.go('${Routes.settings}/${Routes.localizations}');
                },
              ),
            ],
          ),
        ),
      ),
    ).padding(edgeInsets: const EdgeInsets.all(14));
  }
}
