import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/ui/common/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late final _themeBloc = context.read<ThemeBloc>();
  late bool _isDarkThemeSelected = _themeBloc.state.isDark;

  @override
  Widget build(BuildContext context) {
    final selectedTheme = _isDarkThemeSelected
        ? S.of(context).dark_theme_title
        : S.of(context).light_theme_title;
    return Scaffold(
      appBar: DefaultAppBar(title: S.of(context).themization),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).current_theme_title(selectedTheme),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              fillColor: _themeBloc.state.colors.primaryBlueColor,
              isSelected: [_isDarkThemeSelected, !_isDarkThemeSelected],
              onPressed: (_) {
                _themeBloc.add(ThemeChangedEvent());
                setState(() {
                  _isDarkThemeSelected = !_isDarkThemeSelected;
                });
              },
              children: const <Widget>[
                Icon(Icons.lightbulb_outlined),
                Icon(Icons.lightbulb, color: Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
