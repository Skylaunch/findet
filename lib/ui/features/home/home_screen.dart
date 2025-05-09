import 'package:dotted_border/dotted_border.dart';
import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:findet/ui/features/home/widgets/add_operation_widget.dart';
import 'package:findet/ui/features/home/widgets/quote_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).discipline_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: colors.primaryTextColor,
                    ),
                  ).padding(
                    edgeInsets: const EdgeInsets.only(bottom: 30, top: 15),
                  ),
                  DottedBorder(
                    color: colors.borderColor,
                    dashPattern: const [6, 6],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(16),
                    child: const SizedBox(
                      height: 465,
                      width: 340,
                      child: Center(child: AddOperationWidget()),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: QuoteItem(
                quoteText: S.of(context).first_quote,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
