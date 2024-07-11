import 'package:HrManagement/data/models/favourite/favourite_user_model.dart';

abstract class IFavouriteUserRepository {
  // Future<void> addToFavouriteUserEvent(
  //     String userId, String itemId, Map<String, dynamic> itemDetails);
  Future<void> addToFavouriteUserEvent(
      String email, FavouriteUserModel favouriteUserModel);
  Future<FavouriteUserModel?> getFavouriteUserByEmail();
  Future<void> deleteFavouriteUserByEmail(String email);
}
