import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    final colors = context.watch<ThemeBloc>().state.colors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 66,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: colors.secondaryColor,
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
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ).padding(edgeInsets: const EdgeInsets.only(right: 16)),
          ],
        ),
      ),
    );
  }
}
