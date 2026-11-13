import 'package:flutter/material.dart';
import '../screens/calculator_screen.dart';
import '../screens/scientific_screen.dart';
import '../screens/history_screen.dart';
import '../screens/custom_calculation_screen.dart';
import '../screens/currency_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String scientific = '/scientific';
  static const String history = '/history';
  static const String customCalc = '/custom-calc';
  static const String currency = '/currency';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const CalculatorScreen(),
    scientific: (context) => const ScientificScreen(),
    history: (context) => const HistoryScreen(),
    customCalc: (context) => const CustomCalculationScreen(),
    currency: (context) => const CurrencyScreen(),
  };
}
