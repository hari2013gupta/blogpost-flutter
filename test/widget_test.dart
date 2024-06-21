// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test21jun/app.dart';

void main() {
  testWidgets('Blog post api refresh smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our home page starts with appbar widget.
    expect(find.text('Blog Posts'), findsOneWidget);
    expect(find.text('Post Detail'), findsNothing);

    // Tap the 'refresh' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that our data has been updated.
    expect(find.text('No post found!'), findsNothing);
    expect(find.text('1. '), findsOneWidget);
  });
}
