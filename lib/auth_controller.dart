import 'auth_service.dart';

class AuthController {
  final AuthService authService;

  AuthController(this.authService);

  Future<String> login(String email, String password) async {
    try {
      final userId = await authService.signIn(email, password);
      return "SUCCESS: $userId";
    } catch (e) {
      return "ERROR: ${e.toString()}";
    }
  }
}
