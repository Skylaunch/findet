import 'package:findet/blocs/global/localization_bloc.dart';
import 'package:findet/ui/common/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationsScreen extends StatefulWidget {
  const LocalizationsScreen({super.key});

  @override
  State<LocalizationsScreen> createState() => _LocalizationsScreenState();
}

class _LocalizationsScreenState extends State<LocalizationsScreen> {
  late LocalizationBloc localizationBloc = context.read<LocalizationBloc>();
  late bool isSelected = localizationBloc.state.isRussian;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Локализация'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Текущий язык: ${isSelected ? 'Английский' : 'Русский'}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              fillColor: Colors.blue,
              isSelected: [isSelected, !isSelected],
              onPressed: (_) {
                localizationBloc.add(LocalizationChangeEvent(isRussian: isSelected));
                setState(() {
                  isSelected = !isSelected;
                });
              },
              children: const <Widget>[
                Text('ENG'),
                Text('RU'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
