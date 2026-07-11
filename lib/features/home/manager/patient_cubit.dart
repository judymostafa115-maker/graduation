import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/patient_model.dart';
import '../data/repo/patient_repo.dart';
import 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientLoading()) {
    listenToPatients();
  }

  StreamSubscription? _subscription;

  void listenToPatients() {
    emit(PatientLoading());

    _subscription = PatientRepo.getPatients().listen(
          (patients) {
        emit(PatientLoaded(patients));
      },
      onError: (error) {
        emit(PatientError(error.toString()));
      },
    );
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await PatientRepo.addPatient(patient);
    } catch (e) {
      emit(PatientError(e.toString()));
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await PatientRepo.updatePatient(patient);
    } catch (e) {
      emit(PatientError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
