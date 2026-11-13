import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/widgets/calculator_button.dart';

void main() {
  testWidgets('CalculatorButton renders with text and responds to tap', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CalculatorButton(
            text: '5',
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('5'), findsOneWidget);
    await tester.tap(find.text('5'));
    await tester.pumpAndSettle();
    expect(tapped, isTrue);
  });
}
