import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AnimatedResultDisplay extends StatelessWidget {
  final String value;
  final String expression;

  const AnimatedResultDisplay({
    super.key,
    required this.value,
    required this.expression,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(expression, style: const TextStyle(color: AppColors.textSecondary, fontSize: 18)),
          const SizedBox(height: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              value,
              key: ValueKey(value),
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
