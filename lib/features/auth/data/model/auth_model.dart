class AuthModel {
  final String email;
  final String password;
  final String name;
  final String role;
  final String address;

  AuthModel({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.address,
  });


  Map<String,dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "role": role,
      "address": address,
    };
  }
}
