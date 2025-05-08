import 'package:findet/domain/models/enum/currency_type.dart';

class FinancialOperationModel {
  FinancialOperationModel({
    required this.subtractedValue,
    required this.currency,
    required this.category,
    required this.time,
    required this.description,
  });

  final num subtractedValue;
  final CurrencyType currency;
  final String category;
  final String description;
  final DateTime time;

  Map<String, dynamic> toJson() {
    return {
      'subtractedValue': subtractedValue,
      'currency': currency.toString(),
      'category': category,
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  factory FinancialOperationModel.fromJson(Map<String, dynamic> json) => FinancialOperationModel(
        subtractedValue: json['subtractedValue'],
        currency: CurrencyType.fromString(json['currency']),
        category: json['category'],
        description: json['description'],
        time: DateTime.parse(json['time'] as String),
      );
}
