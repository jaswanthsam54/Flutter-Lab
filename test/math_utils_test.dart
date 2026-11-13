import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/logic/math_utils.dart';
import 'package:calculator_app/logic/unit_converter.dart';

void main() {
  group('MathUtils Tests', () {
    test('factorial calculation', () {
      expect(MathUtils.factorial(0), 1);
      expect(MathUtils.factorial(1), 1);
      expect(MathUtils.factorial(5), 120);
    });

    test('gcd & lcm calculation', () {
      expect(MathUtils.gcd(12, 18), 6);
      expect(MathUtils.lcm(4, 6), 12);
    });

    test('degree and radian conversion', () {
      expect(MathUtils.degToRad(180), closeTo(3.14159, 0.0001));
      expect(MathUtils.radToDeg(3.14159), closeTo(180, 0.01));
    });
  });

  group('UnitConverter Tests', () {
    test('length conversion', () {
      expect(UnitConverter.convertLength(1, 'kilometers', 'meters'), 1000);
    });

    test('temperature conversion', () {
      expect(UnitConverter.celsiusToFahrenheit(0), 32);
      expect(UnitConverter.celsiusToFahrenheit(100), 212);
    });
  });
}
