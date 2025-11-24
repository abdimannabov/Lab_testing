class UserProfile {
  final String? name;
  final String? email;

  UserProfile({this.name, this.email});
}

class ProfileManager {
  UserProfile? profile;

  String getWelcomeMessage() {
    // Avoid force-unwrapping profile or name. Provide a safe default.
    final displayName = profile?.name;
    final safeName = (displayName != null && displayName.isNotEmpty)
        ? displayName
        : 'Guest';
    return "Welcome $safeName";
  }
}
