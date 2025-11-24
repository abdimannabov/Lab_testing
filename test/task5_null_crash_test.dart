import 'package:flutter_test/flutter_test.dart';
import 'package:app_3/crash_example.dart';
import 'package:app_3/null_crash_demo.dart';

void main() {
  test('User.printName does not throw when name is null (defensive)', () {
    final user = User();
    // Should not throw because printName is defensive
    expect(() => user.printName(), returnsNormally);
  });

  test(
    'ProfileManager.getWelcomeMessage returns default when profile or name null',
    () {
      final manager = ProfileManager();
      expect(manager.getWelcomeMessage(), contains('Welcome'));
      expect(manager.getWelcomeMessage(), contains('Guest'));

      manager.profile = UserProfile(name: '');
      expect(manager.getWelcomeMessage(), contains('Guest'));

      manager.profile = UserProfile(name: 'Alice');
      expect(manager.getWelcomeMessage(), contains('Alice'));
    },
  );
}
