import 'package:findet/domain/models/enum/currency_type.dart';

class FinancialOperationModel {
  FinancialOperationModel({
    required this.id,
    required this.subtractedValue,
    required this.currency,
    required this.category,
    required this.time,
  });

  final int id;
  final num subtractedValue;
  final CurrencyType currency;
  final String category;
  final DateTime time;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subtractedValue': subtractedValue.toString(),
      'currency': currency.toString(),
      'category': category,
      'time': time.toIso8601String(),
    };
  }

  factory FinancialOperationModel.fromJson(Map<String, dynamic> json) => FinancialOperationModel(
        id: json['id'],
        subtractedValue: json['subtractedValue'],
        currency: CurrencyType.fromString(json['currency']),
        category: json['category'],
        time: DateTime.parse(json['time'] as String),
      );
}
