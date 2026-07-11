import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:medical_app/features/auth/data/model/auth_model.dart';

class AuthenticationRepo {
  static var instance = FirebaseAuth.instance;

  static Future<void> Login({required AuthModel model}) async {
    await instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password
    );
  }


  static Future<void> Signup({required AuthModel model}) async {
    final credential =
    await instance.createUserWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
    await credential.user!.updateDisplayName(model.name);


    final uid = credential.user!.uid;

    await FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(uid)
        .set({
      "name": model.name,
      "email": model.email,
      "role": model.role,
      "address": model.address,
    });
  }


}