import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key, required this.onLocalizationsNavigate});

  // Удалить
  final VoidCallback onLocalizationsNavigate;

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsMenuItem(
          title: S.of(context).theme,
          selectedValue: themeBloc.state.isDark ? 'Dark' : 'Light',
          onTap: () {
            themeBloc.add(ThemeChangedEvent());
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        SettingsMenuItem(
          title: S.of(context).localization,
          selectedValue: Intl.getCurrentLocale() == 'ru' ? 'Russian' : 'English',
          onTap: widget.onLocalizationsNavigate,
        ),
      ],
    );
  }
}

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.selectedValue,
  });

  final String title;
  final String selectedValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 66,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff646464),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(selectedValue, style: const TextStyle(fontSize: 12)),
              ],
            ).padding(edgeInsets: const EdgeInsets.all(12)),
            const Spacer(),
            SvgPicture.asset(
              'lib/assets/images/icons/additionals/chevron_right.svg',
              colorFilter: const ColorFilter.mode(Color(0xff8F9098), BlendMode.srcIn),
            ).padding(edgeInsets: const EdgeInsets.only(right: 16)),
          ],
        ),
      ),
    );
  }
}
