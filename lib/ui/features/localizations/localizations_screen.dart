import 'package:findet/blocs/global/localization_bloc.dart';
import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
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
  late bool isRussianSelected = localizationBloc.state.isRussian;
  @override
  Widget build(BuildContext context) {
    final currentLanguage = isRussianSelected ? S.of(context).russian_language_title : S.of(context).english_language_title;
    final colors = context.watch<ThemeBloc>().state.colors;
    return Scaffold(
      appBar: DefaultAppBar(title: S.of(context).localization),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).current_language_title(currentLanguage),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              fillColor: colors.primaryBlueColor,
              isSelected: [isRussianSelected, !isRussianSelected],
              onPressed: (_) {
                setState(() {
                  isRussianSelected = !isRussianSelected;
                });
                localizationBloc.add(LocalizationChangeEvent(isRussian: isRussianSelected));
              },
              children: const <Widget>[
                Text('RU'),
                Text('ENG'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
