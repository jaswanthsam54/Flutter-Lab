import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ScientificScreen extends StatelessWidget {
  const ScientificScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'sin(30) + √(9) + 2³ = 10.5',
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Extended scientific functions active', style: TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
