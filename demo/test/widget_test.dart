// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo/main.dart';

void main() {
  testWidgets('Adding task test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the '+' icon to open the dialog.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter text into the TextField.
    await tester.enterText(find.byType(TextField), 'Test task');

    // Tap the 'Add' button and trigger a frame.
    await tester.tap(find.widgetWithText(TextButton, 'Add'));
    await tester.pumpAndSettle();

    // Verify that our task has been added.
    expect(find.text('Test task'), findsOneWidget);
  });
}
