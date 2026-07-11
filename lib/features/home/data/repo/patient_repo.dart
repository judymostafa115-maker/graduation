import 'package:firebase_database/firebase_database.dart';
import '../model/patient_model.dart';

class PatientRepo {
  static final DatabaseReference _ref =
  FirebaseDatabase.instance.ref("patients");


  static Stream<List<Patient>> getPatients() {
    return _ref.onValue.map((event) {
      final data = event.snapshot.value as Map?;
      if (data == null) return [];

      return data.entries.map((e) {
        return Patient.fromMap(
          e.key,
          Map<String, dynamic>.from(e.value),
        );
      }).toList();
    });
  }

  static Future<void> addPatient(Patient patient) async {
    final newRef = _ref.push();
    await newRef.set(patient.toMap());
  }

  static Future<void> updatePatient(Patient patient) async {
    await _ref.child(patient.id).update(patient.toMap());
  }
}
