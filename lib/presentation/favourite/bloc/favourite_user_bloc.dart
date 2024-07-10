import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_redo/core/service_locator/service_locator.dart';
import 'package:hr_app_redo/data/models/favourite/favourite_user_model.dart';
import 'package:hr_app_redo/domain/repository/ifavourite_repository.dart';

part 'favourite_user_event.dart';
part 'favourite_user_state.dart';

class FavouriteUserBloc extends Bloc<FavouriteUserEvent, FavouriteUserState> {
  FavouriteUserBloc() : super(const FavouriteUserState()) {
    on<AddToFavouriteUserEvent>((event, emit) async {
      log("Adding user ${event.email} to favourites");
      emit(state.copyWith(error: null));

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        log("No user ");
        return;
      }

      final favouriteUserModel = FavouriteUserModel(emails: [event.email]);
      try {
        await favouriteUserRepository.addToFavouriteUserEvent(
            currentUser.email!, favouriteUserModel);
        emit(state.copyWith(
            favouriteUserStateEnum: FavouriteUserStateEnum.success));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
    on<GetFavouriteUserByEmail>((event, emit) async {
      try {
        emit(state.copyWith(
            favouriteUserStateEnum: FavouriteUserStateEnum.loading,
            error: null));
        final favouriteUserList =
            await favouriteUserRepository.getFavouriteUserByEmail();
        emit(state.copyWith(
            favouriteUserStateEnum: FavouriteUserStateEnum.success,
            favouriteUserModel: favouriteUserList));
      } on FirebaseException catch (e) {
        emit(state.copyWith(
            favouriteUserStateEnum: FavouriteUserStateEnum.failure,
            error: e.toString()));
      } on Exception catch (e) {
        emit(state.copyWith(
            favouriteUserStateEnum: FavouriteUserStateEnum.failure,
            error: e.toString()));
      }
    });
    on<DeleteFavouriteUserByEmail>((event, emit) async {
      try {
        // emit(state.copyWith(cartStateEnum: CartStateEnum.loading));
        await favouriteUserRepository.deleteFavouriteUserByEmail(event.email);
        emit(state.copyWith(
          favouriteUserStateEnum: FavouriteUserStateEnum.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          favouriteUserStateEnum: FavouriteUserStateEnum.failure,
          error: e.toString(),
        ));
      }
    });
  }

  final IFavouriteUserRepository favouriteUserRepository =
      getIt.get<IFavouriteUserRepository>();
}
