enum CurrencyType {
  rubles,
  euro,
  dollar,
  belarusianRuble;

  @override
  String toString() {
    switch (this) {
      case CurrencyType.rubles:
        return 'RUB';
      case CurrencyType.belarusianRuble:
        return 'BYN';
      case CurrencyType.dollar:
        return 'USD';
      case CurrencyType.euro:
        return 'EUR';
    }
  }

  static CurrencyType fromString(String currencyAsString) {
    switch (currencyAsString) {
      case 'RUB':
        return CurrencyType.rubles;
      case 'BYN':
        return CurrencyType.belarusianRuble;
      case 'USD':
        return CurrencyType.dollar;
      case 'EUR':
        return CurrencyType.euro;
      default:
        throw ('Ошибка при преобразовании валюты из строки');
    }
  }
}
