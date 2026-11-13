import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/services/currency_api_service.dart';

void main() {
  group('CurrencyApiService Tests', () {
    final service = CurrencyApiService();

    test('convert USD to INR', () {
      final inr = service.convert(100, 'USD', 'INR');
      expect(inr, 8500.0);
    });

    test('convert identity currency', () {
      final usd = service.convert(50, 'USD', 'USD');
      expect(usd, 50.0);
    });

    test('async getExchangeRate returns positive value', () async {
      final rate = await service.getExchangeRate('USD', 'EUR');
      expect(rate, greaterThan(0));
    });
  });
}
