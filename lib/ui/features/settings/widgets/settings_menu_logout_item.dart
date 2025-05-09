import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsMenuLogoutItem extends StatelessWidget {
  const SettingsMenuLogoutItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
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
          color: colors.appErrorColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).padding(edgeInsets: const EdgeInsets.only(left: 12)),
      ),
    );
  }
}
