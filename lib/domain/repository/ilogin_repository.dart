import 'package:firebase_auth/firebase_auth.dart';

abstract interface class ILogInRepository {
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
  Future<UserCredential> getUserInfo();
  // Future<bool> getLoginInfo();
}
