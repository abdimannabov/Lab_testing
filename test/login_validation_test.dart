import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_3/login_screen.dart';

void main() {
  testWidgets('Required field errors appear when fields are empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text("Password is required"), findsOneWidget);
  });

  testWidgets('Invalid email shows correct error', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byKey(const Key('emailField')), 'not-an-email');
    await tester.enterText(find.byKey(const Key('passwordField')), '12345');

    await tester.pump();

    expect(find.text('Invalid email format'), findsOneWidget);
  });

  testWidgets('Valid data enables the submit button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(
      find.byKey(const Key('emailField')),
      'test@example.com',
    );
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');

    await tester.pump();

    final button = tester.widget<ElevatedButton>(
      find.byKey(const Key('submitButton')),
    );

    expect(button.onPressed != null, true);
  });
}
