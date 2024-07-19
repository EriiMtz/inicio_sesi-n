class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  String get fullName => '$firstName $lastName';

  // Otros métodos y constructores aquí...
}
