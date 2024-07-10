part of 'favourite_user_bloc.dart';

abstract class FavouriteUserEvent extends Equatable {
  const FavouriteUserEvent();

  @override
  List<Object> get props => [];
}

class AddToFavouriteUserEvent extends FavouriteUserEvent {
  final String email;

  const AddToFavouriteUserEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class GetFavouriteUserByEmail extends FavouriteUserEvent {}

class DeleteFavouriteUserByEmail extends FavouriteUserEvent {
  final String email;

  const DeleteFavouriteUserByEmail({required this.email});

  @override
  List<Object> get props => [email];
}
