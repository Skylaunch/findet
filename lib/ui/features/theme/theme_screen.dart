import 'package:findet/blocs/global/theme_bloc.dart';
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
  late bool _isSelected = _themeBloc.state.isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Темизация'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Текущая тема: ${_isSelected ? 'Тёмная' : 'Светлая'}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              fillColor: Colors.blue,
              isSelected: [_isSelected, !_isSelected],
              onPressed: (_) {
                _themeBloc.add(ThemeChangedEvent());
                setState(() {
                  _isSelected = !_isSelected;
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
