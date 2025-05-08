import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/blocs/local/diagram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateFilterItem extends StatelessWidget {
  const DateFilterItem({
    super.key,
    required this.dateFilterTime,
    required this.isSelected,
  });

  final DateTime dateFilterTime;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final diagramBloc = context.read<DiagramBloc>();
    final colors = context.watch<ThemeBloc>().state.colors;

    return Container(
      height: 62,
      width: 44,
      decoration: BoxDecoration(
        color: isSelected ? colors.primaryBlueColor : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            diagramBloc.getDayFirstLetters(dateFilterTime),
            style: TextStyle(
              color: colors.secondaryBlueColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dateFilterTime.day.toString(),
            style: TextStyle(
              color: colors.secondaryBlueColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
