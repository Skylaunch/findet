import 'package:findet/domain/base/global_data.dart';

extension ExtensionsAsync<T> on Future<T> {
  Future<T?> safe() async {
    try {
      return await this;
    } catch (e, stackTrace) {
      appLogger.e(
        "Ошибка во время safe выполнения",
        error: e,
        stackTrace: stackTrace,
      );
    }

    return null;
  }
}
