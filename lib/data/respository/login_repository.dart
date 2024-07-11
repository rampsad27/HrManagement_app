import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HrManagement/domain/repository/ilogin_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LogInRepository implements ILogInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LogInRepository() {
    _getSharedPreferenceInstance();
  }

  SharedPreferences? pref;

  Future<void> _getSharedPreferenceInstance() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      await pref?.setString("email", email);
      await pref?.setString("password", password);
      return userCredential;
    } catch (e) {
      log("Erorr found"); //here
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await pref?.remove("email");
    await pref?.remove("password");
  }

  @override
  Future<UserCredential> getUserInfo() async {
    //from saved
    await _getSharedPreferenceInstance();
    var email = pref?.getString("email");
    var password = pref?.getString("password");

    if (email != null && password != null) {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_NO_CREDENTIALS',
        message: 'No saved credentials found.',
      );
    }
  }
}
