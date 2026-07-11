import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../model/profile_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance.ref();

  Future<void> getUserData() async {
    emit(ProfileLoading());

    try {
      final uid = _auth.currentUser!.uid;

      final snapshot =
      await _db.child("users").child(uid).get();

      if (snapshot.exists && snapshot.value != null) {
        final user = ProfileModel.fromMap(snapshot.value as Map);
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileLoaded(
          ProfileModel(
            name: _auth.currentUser?.displayName ?? "",
            email: _auth.currentUser?.email ?? "",
            role: "doctor",
            address: "",
          ),
        ));
      }


    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel user) async {
    emit(ProfileLoading());

    try {
      final uid = _auth.currentUser!.uid;

      await _db.child("users").child(uid).set(user.toMap());

      emit(ProfileSuccess());
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

}
