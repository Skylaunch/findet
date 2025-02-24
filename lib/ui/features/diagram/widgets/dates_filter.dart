import 'package:findet/blocs/local/diagram_bloc.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:findet/ui/features/diagram/widgets/date_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatesFilter extends StatefulWidget {
  const DatesFilter({super.key});

  @override
  State<DatesFilter> createState() => _DatesFilterState();
}

class _DatesFilterState extends State<DatesFilter> {
  @override
  Widget build(BuildContext context) {
    final diagramBloc = context.watch<DiagramBloc>();
    final diagramBlocState = diagramBloc.state;

    return diagramBlocState is DiagramLoadedState
        ? SizedBox(
            width: MediaQuery.of(context).size.width - 18,
            height: 94,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  // itemCount: diagramBlocState.financialOperations.length,
                  itemBuilder: (context, index) {
                    // final operation = diagramBlocState.financialOperations[index];
                    // final isSelected = operation.time.isEqual(diagramBlocState.filteringTime);

                    DateTime date = DateTime.now().subtract(Duration(days: index));
                    final isSelected = date.isEqual(diagramBlocState.filteringTime);

                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        diagramBloc.add(DiagramDateFilteringEvent(filteringTime: date));
                      },
                      child: DateFilterItem(
                        dateFilterTime: date, //operation.time,
                        isSelected: isSelected,
                      ),
                    );
                  }),
            ),
          )
        : const SizedBox.shrink();
  }
}
