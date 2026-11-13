import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockHistory = [
      '12,500 + 3,750 = 16,250',
      'sin(30) + √(9) = 3.5',
      '100 × 5 = 500',
      '√144 = 12',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Calculation History'),
        backgroundColor: AppColors.background,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mockHistory.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white12),
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.history, color: AppColors.accent),
          title: Text(mockHistory[i], style: const TextStyle(color: AppColors.textPrimary)),
          trailing: const Icon(Icons.copy, size: 18, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
