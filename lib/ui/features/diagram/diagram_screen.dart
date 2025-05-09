import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/blocs/local/diagram_bloc.dart';
import 'package:collection/collection.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/ui/features/diagram/widgets/dates_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiagramScreen extends StatefulWidget {
  const DiagramScreen({super.key});

  @override
  State<DiagramScreen> createState() => _DiagramScreenState();
}

class _DiagramScreenState extends State<DiagramScreen> {
  late final DiagramBloc diagramBloc;

  @override
  void initState() {
    super.initState();

    diagramBloc = context.read<DiagramBloc>()..add(DiagramStartLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DatesFilter(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Container(
                height: 1,
                color: colors.secondaryBorderColor,
              ),
            ),
            const SizedBox(height: 31),
            SizedBox(
              height: 480,
              child: BlocBuilder<DiagramBloc, DiagramState>(
                builder: (context, state) => state is DiagramLoadedState
                    ? state.financialOperations.isNotEmpty
                        ? SfCircularChart(
                            title: ChartTitle(
                                text: S.of(context).your_expenses_title),
                            legend: const Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                            ),
                            palette: colors.diagramColors.toPalette(),
                            series: <CircularSeries>[
                              PieSeries<(String, num)?, String>(
                                dataSource: sumFinancialOperations(
                                    state.financialOperations),
                                xValueMapper: ((String, num)? value, _) =>
                                    value?.$1,
                                yValueMapper: ((String, num)? value, _) =>
                                    value?.$2,
                                explode: true,
                                explodeOffset: '10%',
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                animationDuration: 500,
                              )
                            ],
                          )
                        : Center(
                            child: Text(
                            S.of(context).zero_expenses_text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.secondaryBlueColor,
                              fontSize: 23,
                            ),
                          ))
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Временный метод для суммирования оперций в рамках каждой категории
  List<(String, num)> sumFinancialOperations(
      List<FinancialOperationModel> financialOperations) {
    List<(String, num)> resultOperations = [];

    for (final financialOperation in financialOperations) {
      final operationWithSimilarCategory = resultOperations.firstWhereOrNull(
          (resultOperation) =>
              resultOperation.$1 == financialOperation.category);
      if (operationWithSimilarCategory != null) {
        resultOperations.remove(operationWithSimilarCategory);
        resultOperations.add((
          operationWithSimilarCategory.$1,
          operationWithSimilarCategory.$2 + financialOperation.subtractedValue
        ));
      } else {
        resultOperations.add(
            (financialOperation.category, financialOperation.subtractedValue));
      }
    }

    return resultOperations;
  }
}
