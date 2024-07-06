import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String position,
    required String appliedDate,
    required String picture,
    required int viber,
    required int whatsapp,
    required int cell,
    required String email,
    required String address,
    required String github,
    required String linkedIn,
    required String bio,
    required String eName,
    required int eNumber,
    required String eRelation,
    required String password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
