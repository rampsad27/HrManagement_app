import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HrManagement/data/models/favourite/favourite_user_model.dart';
import 'package:HrManagement/domain/repository/ifavourite_repository.dart';

class FavouriteUserRepository implements IFavouriteUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  //! tring for email in a list
  // Future<void> addToFavouriteUserEvent(
  //     String userId, String itemId, Map<String, dynamic> itemDetails) async {
  //   CollectionReference favorites = FirebaseFirestore.instance
  //       .collection('usersfav')
  //       .doc(userId)
  //       .collection('favorites');
  //   await favorites.doc(itemId).set(itemDetails);
  // }
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
    // final currentUser = _auth.currentUser;
    // CollectionReference favorites = FirebaseFirestore.instance
    //     .collection('usersfav')
    //     .doc(currentUser?.uid)
    //     .collection('favorites');
    // QuerySnapshot querySnapshot = await favorites.get();
    // return null;
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

      final docRef =
          _firestore.collection('favouriteUser').doc(currentUser.email);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        List<dynamic> emails =
            (docSnapshot.data() as Map<String, dynamic>)['emails'] ?? [];

        // Remove the email from the list
        emails.remove(email);

        // Update the Firestore document with the modified list
        await docRef.update({'emails': emails});

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
