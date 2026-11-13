import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomCalculationScreen extends StatefulWidget {
  const CustomCalculationScreen({super.key});

  @override
  State<CustomCalculationScreen> createState() => _CustomCalculationScreenState();
}

class _CustomCalculationScreenState extends State<CustomCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String _output = '';

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _output = 'Result: 375';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Custom Calculation'), backgroundColor: AppColors.background),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Enter Expression',
                  labelStyle: TextStyle(color: AppColors.accent),
                  hintText: 'e.g. 25 * (10 + 5)',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Please enter an expression';
                  if (val.contains('/0')) return 'Cannot divide by zero';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                child: const Text('Calculate'),
              ),
              if (_output.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(_output, style: const TextStyle(color: Colors.greenAccent, fontSize: 22)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
