import 'package:flutter/widgets.dart';

abstract class ToastsService {
  void showDefaultToast({required String message, required BuildContext context});
  void showErrorToast({required String message, required BuildContext context});
}
