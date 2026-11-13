import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../services/currency_api_service.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _api = CurrencyApiService();
  String _from = 'USD';
  String _to = 'INR';
  double _amount = 100;

  @override
  Widget build(BuildContext context) {
    double converted = _api.convert(_amount, _from, _to);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Currency Converter'), backgroundColor: AppColors.background),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Amount: $_amount $_from', style: const TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Converted: ₹ ${converted.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.greenAccent, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
