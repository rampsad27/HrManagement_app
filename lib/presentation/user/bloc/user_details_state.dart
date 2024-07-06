// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_details_bloc.dart';

enum UserDetailsStateEnum {
  initial,
  loading,
  success,
  failure,
}

class UserDetailsState extends Equatable {
  final UserDetailsStateEnum? userDetailsStateEnum;
  final List<UserModel>? userModelList;
  final UserModel? userModel;
  final String? error;
  const UserDetailsState({
    this.userDetailsStateEnum,
    this.userModelList,
    this.userModel,
    this.error,
  });

  @override
  List<Object?> get props =>
      [userDetailsStateEnum, userModelList, userModel, error];

  UserDetailsState copyWith({
    UserDetailsStateEnum? userDetailsStateEnum,
    List<UserModel>? userModelList,
    UserModel? userModel,
    String? error,
  }) {
    return UserDetailsState(
      userDetailsStateEnum: userDetailsStateEnum ?? this.userDetailsStateEnum,
      userModelList: userModelList ?? this.userModelList,
      userModel: userModel ?? this.userModel,
      error: error ?? this.error,
    );
  }
}
