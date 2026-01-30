class Patient {
  final String name;
  final DateTime birthDate;
  final String address;
  List<String> diagnoses;

  Patient({
    required this.name,
    required this.birthDate,
    required this.address,
    required this.diagnoses,
  });
}

