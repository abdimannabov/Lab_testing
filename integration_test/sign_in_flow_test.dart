import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:app_3/login_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Sign-in flow navigates to home screen', (
    WidgetTester tester,
  ) async {
    // Build a host app that can navigate when LoginScreen calls onSuccess
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return LoginScreen(
              onSuccess: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const _HomeScreen()));
              },
            );
          },
        ),
      ),
    );

    // Enter valid email and password
    await tester.enterText(
      find.byKey(const Key('emailField')),
      'user@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('passwordField')),
      'password123',
    );

    // Tap the login button
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pumpAndSettle();

    // Verify home screen is shown
    expect(find.text('Home'), findsOneWidget);
  });
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Home')));
  }
}
