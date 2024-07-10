import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_app_redo/data/models/favourite/favourite_user_model.dart';
import 'package:hr_app_redo/domain/repository/ifavourite_repository.dart';

class FavouriteUserRepository implements IFavouriteUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> addToFavouriteUserEvent(
      String email, FavouriteUserModel favouriteUserModel) async {
    try {
      log("Attempting to save favourite user list: ${favouriteUserModel.toJson()}");
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        log("No  user ");
        return;
      }

      final docRef =
          _firestore.collection('favouriteUser').doc(currentUser.email);

      await docRef.set(favouriteUserModel.toJson(),
          SetOptions(merge: true)); //1 user matra aayo
      log("Favouritesaved ");
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.toString()}");
    } on Exception catch (e) {
      log("Exception: ${e.toString()}");
    }
  }

  @override
  Future<FavouriteUserModel?> getFavouriteUserByEmail() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        log("No current user found");
        return null;
      }
      log("Fetching favourite users for: ${currentUser.email}");
      final DocumentSnapshot docSnapshot = await _firestore
          .collection('favouriteUser')
          .doc(currentUser.email)
          .get();

      if (docSnapshot.exists) {
        return FavouriteUserModel.fromJson(
            docSnapshot.data() as Map<String, dynamic>);
      } else {
        log("No favourite users found");
        return null;
      }
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.toString()}");
    } on Exception catch (e) {
      log("Exception: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<void> deleteFavouriteUserByEmail(String email) async {
    try {
      log("Attempting to delete favourite user: $email");
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        log("No authenticated user found");
        return;
      }

      final DocumentSnapshot docSnapshot = await _firestore
          .collection('favouriteUser')
          .doc(currentUser.email)
          .get();

      if (docSnapshot.exists) {
        FavouriteUserModel favouriteUserModel = FavouriteUserModel.fromJson(
            docSnapshot.data() as Map<String, dynamic>);
        favouriteUserModel.emails.remove(email);
        await _firestore
            .collection('favouriteUser')
            .doc(currentUser.email)
            .set(favouriteUserModel.toJson());
        log("Favourite user removed successfully");
      } else {
        log("No favourite users found to delete");
      }
    } on FirebaseException catch (e) {
      log("FirebaseException: ${e.toString()}");
    } on Exception catch (e) {
      log("Exception: ${e.toString()}");
    }
  }
}
