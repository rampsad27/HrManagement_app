import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:HrManagement/core/service_locator/service_locator.dart';
import 'package:HrManagement/data/models/user/user_model.dart';
import 'package:HrManagement/domain/repository/iuser_repository.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(const UserDetailsState()) {
    on<GetUserEvent>((event, emit) async {
      try {
        await emit.forEach(userRepository.getRealTimeStreamData(),
            onData: (data) {
          return state.copyWith(
              userDetailsStateEnum: UserDetailsStateEnum.success,
              userModelList: data);
        }, onError: (e, _) {
          return state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
          );
        });
      } catch (e) {
        emit(state.copyWith(
            userDetailsStateEnum: UserDetailsStateEnum.failure,
            error: e.toString()));
      }
    });

    on<GetUserByIdEvent>((event, emit) async {
      try {
        emit(
            state.copyWith(userDetailsStateEnum: UserDetailsStateEnum.loading));
        var res = await userRepository.getUserById(event.email);
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.success,
          userModel: res,
        ));
      } catch (e) {
        emit(state.copyWith(
          userDetailsStateEnum: UserDetailsStateEnum.failure,
          error: e.toString(),
        ));
      }
    });

    // Handle Locale Change Event
    on<ChangeLocaleEvent>((event, emit) {
      emit(state.copyWith(locale: event.locale));
    });
  }

  final IUserRepository userRepository = getIt.get<IUserRepository>();
}
