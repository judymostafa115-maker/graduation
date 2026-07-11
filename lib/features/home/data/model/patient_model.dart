class Patient {
  final String id;
  final String name;
  final DateTime birthDate;
  final String address;
  List<String> diagnoses;

  Patient({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.address,
    required this.diagnoses,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "birthDate": birthDate.toString(),
      "address": address,
      "diagnoses": diagnoses,
    };
  }

  factory Patient.fromMap(String id, Map data) {
    return Patient(
      id: id,
      name: data["name"],
      birthDate: DateTime.parse(data["birthDate"]),
      address: data["address"],
      diagnoses: List<String>.from(data["diagnoses"] ?? []),
    );
  }
}
