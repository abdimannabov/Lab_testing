class User {
  String? name;

  void printName() {
    print(name!.toUpperCase()); // <-- This will crash if name is null
  }
}
