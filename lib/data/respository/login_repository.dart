import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_app_redo/domain/repository/ilogin_repository.dart';

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

  // @override
  // Future<bool> getLoginInfo() async {

  //   try {
  //     final user = _firebaseAuth.currentUser;
  //     if (user == null) {
  //       log('No user is currently logged in.');
  //       return checkAdmin;
  //     }

  //     final QuerySnapshot querySnapshot = await _firestore
  //         .collection('user')
  //         .where('email', isEqualTo: user.email)
  //         .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       checkAdmin = querySnapshot.docs.first.get('isAdmin');
  //     } else {
  //       log('No login information found for the user with email: ${user.email}');
  //     }
  //   } on FirebaseException catch (e) {
  //     log('FirebaseException: $e');
  //   } catch (e) {
  //     log('An error occurred: $e');
  //   }

  //   return checkAdmin;
  // }

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
