class User {
  String? name;

  void printName() {
    // Defensive null-safety: avoid force-unwrapping `name`.
    final currentName = name;
    if (currentName == null || currentName.isEmpty) {
      // handle gracefully instead of crashing
      print('Name is not set');
      return;
    }
    print(currentName.toUpperCase());
  }
}
