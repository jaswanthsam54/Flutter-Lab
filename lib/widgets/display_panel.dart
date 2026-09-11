import 'package:flutter/material.dart';
import '../logic/calculator_logic.dart';
import '../theme/app_colors.dart';

class DisplayPanel extends StatelessWidget {
  final String expression;
  final String displayValue;
  final CalculatorOperation currentOperation;

  const DisplayPanel({
    super.key,
    required this.expression,
    required this.displayValue,
    required this.currentOperation,
  });

  int _getFontSize(String value) {
    if (value.length >= 14) return 30;
    if (value.length >= 11) return 38;
    if (value.length >= 8) return 46;
    return 58;
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = _getFontSize(displayValue).toDouble();
    final isError = displayValue == 'Error';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        gradient: AppGradients.displayGradient,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentText.withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Expression line
          SizedBox(
            height: 28,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Text(
                expression,
                key: ValueKey(expression),
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'monospace',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Main display value
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ),
                  ),
                  child: child,
                ),
              );
            },
            child: FittedBox(
              key: ValueKey(displayValue),
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                _formatDisplayValue(displayValue),
                style: TextStyle(
                  color: isError ? AppColors.error : AppColors.primaryText,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'monospace',
                  letterSpacing: -1,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Operation indicator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _opIndicator('+', CalculatorOperation.add),
              const SizedBox(width: 6),
              _opIndicator('−', CalculatorOperation.subtract),
              const SizedBox(width: 6),
              _opIndicator('×', CalculatorOperation.multiply),
              const SizedBox(width: 6),
              _opIndicator('÷', CalculatorOperation.divide),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDisplayValue(String value) {
    if (value == 'Error' || value.contains('e') || value == '∞' || value == '-∞') {
      return value;
    }

    final parts = value.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? parts[1] : null;

    // Add thousand separators to integer part
    final absInt = intPart.startsWith('-') ? intPart.substring(1) : intPart;
    final negative = intPart.startsWith('-');

    final buffer = StringBuffer();
    for (int i = 0; i < absInt.length; i++) {
      if (i > 0 && (absInt.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(absInt[i]);
    }

    String result = (negative ? '-' : '') + buffer.toString();
    if (decPart != null) result += '.$decPart';
    return result;
  }

  Widget _opIndicator(String symbol, CalculatorOperation op) {
    final isActive = currentOperation == op;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.accentText.withOpacity(0.25)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: isActive
            ? Border.all(color: AppColors.accentText.withOpacity(0.5), width: 1)
            : null,
      ),
      child: Text(
        symbol,
        style: TextStyle(
          color: isActive ? AppColors.accentText : AppColors.secondaryText.withOpacity(0.4),
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
