class ProfileModel {
  final String name;
  final String email;
  final String role;
  final String address;

  ProfileModel({
    required this.name,
    required this.email,
    required this.role,
    required this.address,
  });

  factory ProfileModel.fromMap(Map<dynamic, dynamic> map) {
    return ProfileModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      address: map['address'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "address": address,
    };
  }
}
