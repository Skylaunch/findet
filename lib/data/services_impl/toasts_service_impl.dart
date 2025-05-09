import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/domain/services/toasts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastsServiceImpl extends ToastsService {
  @override
  void showDefaultToast(
      {required String message, required BuildContext context}) {
    final colors = context.read<ThemeBloc>().state.colors;
    FToast().init(context).showToast(
        child: Container(
          decoration: BoxDecoration(
            color: colors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: colors.primaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gravity: ToastGravity.TOP);
  }

  @override
  void showErrorToast(
      {required String message, required BuildContext context}) {
    final colors = context.read<ThemeBloc>().state.colors;
    FToast().init(context).showToast(
        child: Container(
          decoration: BoxDecoration(
            color: colors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors.appErrorColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        gravity: ToastGravity.TOP);
  }
}
