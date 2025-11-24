class UserProfile {
  final String? name;
  final String? email;

  UserProfile({this.name, this.email});
}

class ProfileManager {
  UserProfile? profile;

  String getWelcomeMessage() {
    return "Welcome ${profile!.name!}";
  }
}
