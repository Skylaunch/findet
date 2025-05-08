import 'package:findet/domain/services/toasts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastsServiceImpl extends ToastsService {
  @override
  void showDefaultToast({required String message, required BuildContext context}) {
    FToast().init(context).showToast(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        gravity: ToastGravity.TOP);
  }

  @override
  void showErrorToast({required String message, required BuildContext context}) {
    FToast().init(context).showToast(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        gravity: ToastGravity.TOP);
  }
}
