part of 'favourite_user_bloc.dart';

enum FavouriteUserStateEnum { initial, loading, success, failure }

class FavouriteUserState extends Equatable {
  final FavouriteUserStateEnum favouriteUserStateEnum;
  final FavouriteUserModel? favouriteUserModel;
  final String? error;

  const FavouriteUserState({
    this.favouriteUserStateEnum = FavouriteUserStateEnum.initial,
    this.favouriteUserModel,
    this.error,
  });
  @override
  List<Object?> get props => [
        favouriteUserStateEnum,
        favouriteUserModel,
        error,
      ];
  FavouriteUserState copyWith({
    FavouriteUserStateEnum? favouriteUserStateEnum,
    FavouriteUserModel? favouriteUserModel,
    String? error,
  }) {
    return FavouriteUserState(
      favouriteUserStateEnum:
          favouriteUserStateEnum ?? this.favouriteUserStateEnum,
      favouriteUserModel: favouriteUserModel ?? this.favouriteUserModel,
      error: error ?? this.error,
    );
  }
}
