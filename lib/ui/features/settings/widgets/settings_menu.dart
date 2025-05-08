import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/ui/features/settings/widgets/settings_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({
    super.key,
    required this.onLocalizationNavigate,
    required this.onThemeNavigate,
    required this.onUserCategoriesNavigate,
  });

  final VoidCallback onLocalizationNavigate;
  final VoidCallback onUserCategoriesNavigate;
  final VoidCallback onThemeNavigate;

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsMenuItem(
            title: S.of(context).theme,
            selectedValue: themeBloc.state.isDark ? 'Dark' : 'Light',
            onTap: widget.onThemeNavigate,
          ),
          const SizedBox(height: 6),
          SettingsMenuItem(
            title: S.of(context).localization,
            selectedValue: Intl.getCurrentLocale() == 'ru' ? 'Russian' : 'English',
            onTap: widget.onLocalizationNavigate,
          ),
          const SizedBox(height: 6),
          SettingsMenuItem(
            title: 'Персональные категории',
            selectedValue: 'Добавьте свои собственные категории для удобства',
            onTap: widget.onUserCategoriesNavigate,
          ),
        ],
      ),
    );
  }
}
