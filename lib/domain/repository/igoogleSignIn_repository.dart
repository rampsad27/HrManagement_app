import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IgoogleSignInRepository {
  Future<UserCredential> signInWithGoogle();
  Future<void> signOut();
}
