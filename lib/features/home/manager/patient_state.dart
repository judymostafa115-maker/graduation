import '../data/model/patient_model.dart';

abstract class PatientState {}

class PatientLoading extends PatientState {}

class PatientLoaded extends PatientState {
  final List<Patient> patients;
  PatientLoaded(this.patients);
}

class PatientError extends PatientState {
  final String message;
  PatientError(this.message);
}
