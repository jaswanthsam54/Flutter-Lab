import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/logic/calculator_logic.dart';

void main() {
  late CalculatorLogic calc;

  setUp(() {
    calc = CalculatorLogic();
  });

  group('Basic Arithmetic', () {
    test('Addition: 5 + 3 = 8', () {
      calc.inputDigit('5');
      calc.setOperation(CalculatorOperation.add);
      calc.inputDigit('3');
      calc.calculate();
      expect(calc.displayValue, '8');
    });

    test('Subtraction: 10 - 4 = 6', () {
      calc.inputDigit('1');
      calc.inputDigit('0');
      calc.setOperation(CalculatorOperation.subtract);
      calc.inputDigit('4');
      calc.calculate();
      expect(calc.displayValue, '6');
    });

    test('Multiplication: 6 × 7 = 42', () {
      calc.inputDigit('6');
      calc.setOperation(CalculatorOperation.multiply);
      calc.inputDigit('7');
      calc.calculate();
      expect(calc.displayValue, '42');
    });

    test('Division: 15 ÷ 3 = 5', () {
      calc.inputDigit('1');
      calc.inputDigit('5');
      calc.setOperation(CalculatorOperation.divide);
      calc.inputDigit('3');
      calc.calculate();
      expect(calc.displayValue, '5');
    });

    test('Division by zero returns Error', () {
      calc.inputDigit('5');
      calc.setOperation(CalculatorOperation.divide);
      calc.inputDigit('0');
      calc.calculate();
      expect(calc.displayValue, 'Error');
    });
  });

  group('Decimal Input', () {
    test('Decimal input works', () {
      calc.inputDigit('3');
      calc.inputDecimal();
      calc.inputDigit('1');
      calc.inputDigit('4');
      expect(calc.displayValue, '3.14');
    });

    test('Cannot input multiple decimals', () {
      calc.inputDigit('3');
      calc.inputDecimal();
      calc.inputDigit('1');
      calc.inputDecimal();
      calc.inputDigit('4');
      expect(calc.displayValue, '3.14');
    });
  });

  group('Sign Toggle', () {
    test('Toggle sign from positive to negative', () {
      calc.inputDigit('5');
      calc.toggleSign();
      expect(calc.displayValue, '-5');
    });

    test('Toggle sign from negative to positive', () {
      calc.inputDigit('5');
      calc.toggleSign();
      calc.toggleSign();
      expect(calc.displayValue, '5');
    });
  });

  group('Clear and Delete', () {
    test('Clear resets to 0', () {
      calc.inputDigit('9');
      calc.inputDigit('9');
      calc.clear();
      expect(calc.displayValue, '0');
    });

    test('Delete removes last character', () {
      calc.inputDigit('1');
      calc.inputDigit('2');
      calc.inputDigit('3');
      calc.delete();
      expect(calc.displayValue, '12');
    });

    test('Delete on single digit resets to 0', () {
      calc.inputDigit('5');
      calc.delete();
      expect(calc.displayValue, '0');
    });
  });

  group('Scientific Functions', () {
    test('Square of 4 = 16', () {
      calc.inputDigit('4');
      calc.scientificFunction('square');
      expect(calc.displayValue, '16');
    });

    test('Square root of 9 = 3', () {
      calc.inputDigit('9');
      calc.scientificFunction('sqrt');
      expect(calc.displayValue, '3');
    });

    test('Log of 100 = 2', () {
      calc.inputDigit('1');
      calc.inputDigit('0');
      calc.inputDigit('0');
      calc.scientificFunction('log');
      expect(calc.displayValue, '2');
    });

    test('Pi constant', () {
      calc.scientificFunction('pi');
      expect(double.tryParse(calc.displayValue), closeTo(3.14159265, 0.000001));
    });

    test('Factorial of 5 = 120', () {
      calc.inputDigit('5');
      calc.scientificFunction('factorial');
      expect(calc.displayValue, '120');
    });

    test('Reciprocal of 4 = 0.25', () {
      calc.inputDigit('4');
      calc.scientificFunction('reciprocal');
      expect(calc.displayValue, '0.25');
    });

    test('Absolute value of negative number', () {
      calc.inputDigit('5');
      calc.toggleSign();
      calc.scientificFunction('abs');
      expect(calc.displayValue, '5');
    });
  });

  group('History', () {
    test('History records calculations', () {
      calc.inputDigit('2');
      calc.setOperation(CalculatorOperation.add);
      calc.inputDigit('3');
      calc.calculate();
      expect(calc.history.isNotEmpty, true);
      expect(calc.history.first.contains('2 + 3'), true);
      expect(calc.history.first.contains('= 5'), true);
    });

    test('History can be cleared', () {
      calc.inputDigit('5');
      calc.setOperation(CalculatorOperation.add);
      calc.inputDigit('5');
      calc.calculate();
      calc.clearHistory();
      expect(calc.history.isEmpty, true);
    });
  });

  group('Percentage', () {
    test('Standalone percentage: 50% = 0.5', () {
      calc.inputDigit('5');
      calc.inputDigit('0');
      calc.percentage();
      expect(calc.displayValue, '0.5');
    });
  });
}
