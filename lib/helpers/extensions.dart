import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget padding({required EdgeInsetsGeometry edgeInsets}) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}
