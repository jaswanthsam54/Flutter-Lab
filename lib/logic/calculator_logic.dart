import 'dart:math' as math;

enum CalculatorOperation { add, subtract, multiply, divide, percent, none }
enum AngleMode { degrees, radians }

class CalculatorLogic {
  String _displayValue = '0';
  String _expression = '';
  double _firstOperand = 0;
  double _secondOperand = 0;
  CalculatorOperation _currentOperation = CalculatorOperation.none;
  bool _shouldResetDisplay = false;
  bool _hasResult = false;
  AngleMode angleMode = AngleMode.degrees;
  bool isScientificMode = false;
  List<String> _history = [];

  String get displayValue => _displayValue;
  String get expression => _expression;
  List<String> get history => List.unmodifiable(_history);

  void inputDigit(String digit) {
    if (_shouldResetDisplay || _displayValue == '0') {
      _displayValue = digit;
      _shouldResetDisplay = false;
    } else {
      if (_displayValue.length >= 15) return;
      _displayValue += digit;
    }
    _hasResult = false;
  }

  void inputDecimal() {
    if (_shouldResetDisplay) {
      _displayValue = '0.';
      _shouldResetDisplay = false;
      return;
    }
    if (!_displayValue.contains('.')) {
      _displayValue += '.';
    }
  }

  void toggleSign() {
    if (_displayValue == '0') return;
    if (_displayValue.startsWith('-')) {
      _displayValue = _displayValue.substring(1);
    } else {
      _displayValue = '-$_displayValue';
    }
  }

  void percentage() {
    double value = double.tryParse(_displayValue) ?? 0;
    if (_currentOperation == CalculatorOperation.add ||
        _currentOperation == CalculatorOperation.subtract) {
      value = _firstOperand * (value / 100);
    } else {
      value = value / 100;
    }
    _displayValue = _formatResult(value);
  }

  void setOperation(CalculatorOperation operation) {
    if (_currentOperation != CalculatorOperation.none && !_shouldResetDisplay) {
      _calculate();
    }
    _firstOperand = double.tryParse(_displayValue) ?? 0;
    _currentOperation = operation;
    _shouldResetDisplay = true;
    _expression = '${_formatResult(_firstOperand)} ${_operationSymbol(operation)}';
    _hasResult = false;
  }

  void calculate() {
    if (_currentOperation == CalculatorOperation.none) return;
    _secondOperand = double.tryParse(_displayValue) ?? 0;
    final expressionStr =
        '${_formatResult(_firstOperand)} ${_operationSymbol(_currentOperation)} ${_formatResult(_secondOperand)}';
    _calculate();
    _expression = '$expressionStr = $_displayValue';
    _addToHistory('$expressionStr = $_displayValue');
    _currentOperation = CalculatorOperation.none;
    _shouldResetDisplay = true;
    _hasResult = true;
  }

  void _calculate() {
    double result = 0;
    switch (_currentOperation) {
      case CalculatorOperation.add:
        result = _firstOperand + (double.tryParse(_displayValue) ?? 0);
        break;
      case CalculatorOperation.subtract:
        result = _firstOperand - (double.tryParse(_displayValue) ?? 0);
        break;
      case CalculatorOperation.multiply:
        result = _firstOperand * (double.tryParse(_displayValue) ?? 0);
        break;
      case CalculatorOperation.divide:
        double divisor = double.tryParse(_displayValue) ?? 0;
        if (divisor == 0) {
          _displayValue = 'Error';
          _expression = 'Cannot divide by zero';
          _currentOperation = CalculatorOperation.none;
          _shouldResetDisplay = true;
          return;
        }
        result = _firstOperand / divisor;
        break;
      default:
        return;
    }
    _displayValue = _formatResult(result);
    _firstOperand = result;
  }

  void scientificFunction(String func) {
    double value = double.tryParse(_displayValue) ?? 0;
    double result = 0;
    String funcName = func;

    switch (func) {
      case 'sin':
        double angle = angleMode == AngleMode.degrees
            ? value * math.pi / 180
            : value;
        result = math.sin(angle);
        break;
      case 'cos':
        double angle = angleMode == AngleMode.degrees
            ? value * math.pi / 180
            : value;
        result = math.cos(angle);
        break;
      case 'tan':
        double angle = angleMode == AngleMode.degrees
            ? value * math.pi / 180
            : value;
        result = math.tan(angle);
        break;
      case 'asin':
        if (value < -1 || value > 1) {
          _displayValue = 'Error';
          return;
        }
        result = math.asin(value);
        if (angleMode == AngleMode.degrees) result = result * 180 / math.pi;
        funcName = 'sin⁻¹';
        break;
      case 'acos':
        if (value < -1 || value > 1) {
          _displayValue = 'Error';
          return;
        }
        result = math.acos(value);
        if (angleMode == AngleMode.degrees) result = result * 180 / math.pi;
        funcName = 'cos⁻¹';
        break;
      case 'atan':
        result = math.atan(value);
        if (angleMode == AngleMode.degrees) result = result * 180 / math.pi;
        funcName = 'tan⁻¹';
        break;
      case 'sqrt':
        if (value < 0) {
          _displayValue = 'Error';
          return;
        }
        result = math.sqrt(value);
        funcName = '√';
        break;
      case 'cbrt':
        result = math.pow(value, 1 / 3).toDouble();
        funcName = '∛';
        break;
      case 'square':
        result = value * value;
        funcName = 'x²';
        break;
      case 'cube':
        result = value * value * value;
        funcName = 'x³';
        break;
      case 'reciprocal':
        if (value == 0) {
          _displayValue = 'Error';
          return;
        }
        result = 1 / value;
        funcName = '1/x';
        break;
      case 'log':
        if (value <= 0) {
          _displayValue = 'Error';
          return;
        }
        result = math.log(value) / math.ln10;
        break;
      case 'ln':
        if (value <= 0) {
          _displayValue = 'Error';
          return;
        }
        result = math.log(value);
        break;
      case 'exp':
        result = math.exp(value);
        funcName = 'eˣ';
        break;
      case '10x':
        result = math.pow(10, value).toDouble();
        funcName = '10ˣ';
        break;
      case 'abs':
        result = value.abs();
        break;
      case 'factorial':
        if (value < 0 || value != value.floor()) {
          _displayValue = 'Error';
          return;
        }
        result = _factorial(value.toInt()).toDouble();
        funcName = 'x!';
        break;
      case 'pi':
        _displayValue = _formatResult(math.pi);
        _expression = 'π';
        return;
      case 'e':
        _displayValue = _formatResult(math.e);
        _expression = 'e';
        return;
      default:
        return;
    }

    _expression = '$funcName($_displayValue)';
    _addToHistory('$funcName(${_formatResult(value)}) = ${_formatResult(result)}');
    _displayValue = _formatResult(result);
    _shouldResetDisplay = true;
  }

  num _factorial(int n) {
    if (n > 20) return double.infinity;
    if (n <= 1) return 1;
    return n * _factorial(n - 1);
  }

  void clear() {
    _displayValue = '0';
    _expression = '';
    _firstOperand = 0;
    _secondOperand = 0;
    _currentOperation = CalculatorOperation.none;
    _shouldResetDisplay = false;
    _hasResult = false;
  }

  void delete() {
    if (_shouldResetDisplay || _displayValue == 'Error') {
      clear();
      return;
    }
    if (_displayValue.length == 1 || 
        (_displayValue.length == 2 && _displayValue.startsWith('-'))) {
      _displayValue = '0';
    } else {
      _displayValue = _displayValue.substring(0, _displayValue.length - 1);
    }
  }

  void clearHistory() {
    _history.clear();
  }

  void _addToHistory(String entry) {
    _history.insert(0, entry);
    if (_history.length > 50) {
      _history.removeLast();
    }
  }

  String _operationSymbol(CalculatorOperation op) {
    switch (op) {
      case CalculatorOperation.add: return '+';
      case CalculatorOperation.subtract: return '−';
      case CalculatorOperation.multiply: return '×';
      case CalculatorOperation.divide: return '÷';
      case CalculatorOperation.percent: return '%';
      case CalculatorOperation.none: return '';
    }
  }

  String _formatResult(double value) {
    if (value.isInfinite) return value > 0 ? '∞' : '-∞';
    if (value.isNaN) return 'Error';
    
    // Handle very large or very small numbers with scientific notation
    if (value.abs() >= 1e15 || (value != 0 && value.abs() < 1e-10)) {
      return value.toStringAsExponential(6)
          .replaceAll('e+', 'e')
          .replaceAll(RegExp(r'\.?0+e'), 'e');
    }
    
    // Remove unnecessary trailing zeros
    if (value == value.truncateToDouble()) {
      return value.toInt().toString();
    }
    
    String result = value.toStringAsFixed(10);
    result = result.replaceAll(RegExp(r'0+$'), '');
    result = result.replaceAll(RegExp(r'\.$'), '');
    return result;
  }

  CalculatorOperation get currentOperation => _currentOperation;
  bool get hasResult => _hasResult;
}
