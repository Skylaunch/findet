class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json, String id) => UserModel(
        id: id,
        email: json['email'],
        firstName: json['firstname'],
        lastName: json['lastname'],
        password: json['password'],
      );

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
