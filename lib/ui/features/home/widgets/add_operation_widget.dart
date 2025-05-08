import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/domain/models/enum/currency_type.dart';
import 'package:findet/domain/models/financial_operation_model.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddOperationWidget extends StatefulWidget {
  const AddOperationWidget({super.key});

  @override
  State<AddOperationWidget> createState() => _AddOperationWidgetState();
}

class _AddOperationWidgetState extends State<AddOperationWidget> {
  // Состояние для выпадающего списка категорий
  String? _selectedCategory;

  // Состояние для выпадающего списка валют
  String? _selectedCurrency;

  // Контроллеры для текстовых полей
  final _descriptionController = TextEditingController();

  final _amountController = TextEditingController();

  // Список категорий (замените своими)
  final List<String> _categories = ['Food', 'Shopping', 'Entertainment', 'Other', 'Other2', 'Other3'];

  final List<String> _currencies = ['USD', 'RUB', 'BYN', 'EUR'];

  @override
  void initState() {
    _selectedCurrency = _currencies.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: colors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Text(
                'How much have you spent?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryColor,
                ),
              ).padding(edgeInsets: const EdgeInsets.only(left: 2)),
              const SizedBox(height: 4),

              // Сумма
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffix: SizedBox(
                    width: 80,
                    height: 16,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButtonFormField2<String>(
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(
                            'lib/assets/images/icons/additionals/chevron_down.svg',
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 15,
                        ),
                        value: _selectedCurrency,
                        items: _currencies
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _selectedCurrency == item ? Colors.white : colors.primaryColor,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (selectedCurrency) {
                          setState(() {
                            _selectedCurrency = selectedCurrency;
                          });
                        },
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 60,
                          offset: const Offset(0, -8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey,
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: WidgetStateProperty.all<double>(6),
                            thumbColor: WidgetStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8),
                ),
              ),
              const SizedBox(height: 8),

              // Описание транзакции
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryColor,
                ),
              ).padding(edgeInsets: const EdgeInsets.only(left: 2)),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 8),

              // Категория
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryColor,
                ),
              ).padding(edgeInsets: const EdgeInsets.only(left: 2)),
              DropdownButtonFormField2<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  border: OutlineInputBorder(),
                ),
                iconStyleData: IconStyleData(
                    icon: SvgPicture.asset(
                  'lib/assets/images/icons/additionals/chevron_down.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ).padding(edgeInsets: const EdgeInsets.only(right: 4))),
                hint: const Text(
                  'Select Item',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                menuItemStyleData: const MenuItemStyleData(height: 40),
                value: _selectedCategory,
                items: _categories
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 16,
                              color: _selectedCategory == item ? Colors.white : colors.primaryColor,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (selectedItem) {
                  setState(() {
                    _selectedCategory = selectedItem;
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 160,
                  offset: const Offset(0, -8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey,
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all<double>(6),
                    thumbColor: WidgetStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Кнопка "Apply"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final now = DateTime.now();
                    final subtractedValue = double.tryParse(_amountController.text) ?? 0;
                    final description = _descriptionController.text;

                    if (_selectedCurrency != null && _selectedCategory != null) {
                      final currencyType = CurrencyType.fromString(_selectedCurrency!);

                      datasource.saveFinanceData(
                        FinancialOperationModel(
                          subtractedValue: subtractedValue,
                          currency: currencyType,
                          category: _selectedCategory!,
                          description: description,
                          time: DateTime.utc(now.year, now.month, now.day),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
