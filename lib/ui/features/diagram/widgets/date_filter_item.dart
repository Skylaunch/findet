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

    return Container(
      height: 62,
      width: 44,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff539DF3) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            diagramBloc.getDayFirstLetters(dateFilterTime),
            style: const TextStyle(
              color: Color(0xffB4DBFF),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dateFilterTime.day.toString(),
            style: const TextStyle(
              color: Color(0xffB4DBFF),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
