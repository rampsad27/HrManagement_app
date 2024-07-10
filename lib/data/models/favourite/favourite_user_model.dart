import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_user_model.freezed.dart';
part 'favourite_user_model.g.dart';

@freezed
class FavouriteUserModel with _$FavouriteUserModel {
  const factory FavouriteUserModel({
    required List<String> emails,
  }) = _FavouriteUserModel;

  factory FavouriteUserModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteUserModelFromJson(json);
}
