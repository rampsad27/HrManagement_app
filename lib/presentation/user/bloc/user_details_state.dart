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
  final String? locale;

  const UserDetailsState({
    this.userDetailsStateEnum,
    this.userModelList,
    this.userModel,
    this.error,
    this.locale = 'en', // Default to English
  });

  @override
  List<Object?> get props =>
      [userDetailsStateEnum, userModelList, userModel, error, locale];

  UserDetailsState copyWith({
    UserDetailsStateEnum? userDetailsStateEnum,
    List<UserModel>? userModelList,
    UserModel? userModel,
    String? error,
    String? locale, // Add locale to copyWith
  }) {
    return UserDetailsState(
      userDetailsStateEnum: userDetailsStateEnum ?? this.userDetailsStateEnum,
      userModelList: userModelList ?? this.userModelList,
      userModel: userModel ?? this.userModel,
      error: error ?? this.error,
      locale: locale ?? this.locale,
    );
  }
}
