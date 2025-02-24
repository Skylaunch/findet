import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget padding({required EdgeInsetsGeometry edgeInsets}) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}

extension DateTimeComparison on DateTime {
  bool isEqual(DateTime otherDateTime) {
    return year == otherDateTime.year && month == otherDateTime.month && day == otherDateTime.day;
  }
}
