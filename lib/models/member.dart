/// A group member shown on the About Us screen.
class Member {
  final String lastName;
  final String firstName;
  final String middleInitial;
  final String role;
  final String bio;
  final String email;

  const Member({
    required this.lastName,
    required this.firstName,
    required this.middleInitial,
    required this.role,
    required this.bio,
    required this.email,
  });

  String get fullName => '$firstName $middleInitial $lastName';
  String get listName => '$lastName, $firstName $middleInitial'; // LN, FN M.I.
  String get initials => '${firstName[0]}${lastName[0]}';
}

/// A gallery photo. Passed to the Photo Details screen as a route argument.
class Photo {
  final String path;
  final String title;
  final String description;
  final Member contributor;

  const Photo({
    required this.path,
    required this.title,
    required this.description,
    required this.contributor,
  });
}
