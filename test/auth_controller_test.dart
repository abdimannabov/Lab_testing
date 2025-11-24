import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:app_3/auth_controller.dart';
import 'package:app_3/auth_service.dart';

import 'auth_service_test.mocks.dart';

void main() {
  late MockAuthService mockAuthService;
  late AuthController controller;

  setUp(() {
    mockAuthService = MockAuthService();
    controller = AuthController(mockAuthService);
  });

  test('Successful login returns SUCCESS message', () async {
    // Arrange
    when(mockAuthService.signIn('test@example.com', '1234'))
        .thenAnswer((_) async => 'user_123');

    // Act
    final result = await controller.login('test@example.com', '1234');

    // Assert
    expect(result, 'SUCCESS: user_123');
    verify(mockAuthService.signIn('test@example.com', '1234')).called(1);
  });

  test('Failed login returns ERROR message', () async {
    // Arrange
    when(mockAuthService.signIn('wrong@example.com', 'badpass'))
        .thenThrow(Exception('Invalid credentials'));

    // Act
    final result = await controller.login('wrong@example.com', 'badpass');

    // Assert
    expect(result.contains('ERROR:'), true);
    expect(result.contains('Invalid credentials'), true);

    verify(mockAuthService.signIn('wrong@example.com', 'badpass')).called(1);
  });
}
