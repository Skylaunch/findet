import 'package:findet/blocs/local/diagram_bloc.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DatesFilter(),
            const SizedBox(height: 31),
            SizedBox(
              height: 480,
              child: BlocBuilder<DiagramBloc, DiagramState>(
                builder: (context, state) => state is DiagramLoadedState
                    ? state.financialOperations.isNotEmpty
                        ? SfCircularChart(
                            title: const ChartTitle(text: 'Ваши расходы'),
                            legend: const Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                            ),
                            palette: const <Color>[
                              Color(0xffBD98EA),
                              Color(0xff8974A3),
                              Color(0xff67478E),
                            ],
                            series: <CircularSeries>[
                              PieSeries<FinancialOperationModel?, String>(
                                dataSource: state.financialOperations,
                                xValueMapper: (FinancialOperationModel? value, _) => value?.category,
                                yValueMapper: (FinancialOperationModel? value, _) => value?.subtractedValue,
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
                        : const Center(
                            child: Text(
                            'В этот день расходов не наблюдается ☺👍',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffB4DBFF),
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
}
