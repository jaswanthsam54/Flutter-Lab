import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/widgets/display_panel.dart';

void main() {
  testWidgets('DisplayPanel renders expression and primary value', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DisplayPanel(
            expression: '12 + 8',
            value: '20',
          ),
        ),
      ),
    );

    expect(find.text('12 + 8'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
  });
}
