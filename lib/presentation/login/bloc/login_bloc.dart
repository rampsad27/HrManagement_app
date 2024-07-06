import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_redo/core/service_locator/service_locator.dart';
import 'package:hr_app_redo/domain/repository/ilogin_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInRequested>((event, emit) async {
      emit(LogInLoadInProgress());

      try {
        await _logInRepository.signInWithEmailAndPassword(
            event.email, event.password);

        emit(const LogInSuccess(message: "bhayo"));
      } catch (e) {
        emit(const LogInFailure(message: "Account not registered"));
      }
    });

    on<CheckLoggedInUser>((event, emit) async {
      emit(LogInLoadInProgress());
      try {
        final userCredential = await _logInRepository.getUserInfo();
        if (userCredential.user != null) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(UnAuthenticated());
      }
    });

    on<LogOutRequested>((event, emit) async {
      emit(LogInLoadInProgress());

      await _logInRepository.signOut();
      emit(const LogoutSuccess(logoutSuccessMessage: "logoutSuccessMessage"));
    });

    // on<CheckAdminStatus>((event, emit) async {
    //   emit(LogInLoadInProgress());
    //   try {
    //     bool isAdmin = await _logInRepository.getLoginInfo();
    //     emit(AdminStatusChecked(isAdmin: isAdmin));
    //   } catch (e) {
    //     emit(LogInFailure(message: e.toString()));
    //   }
    // });
  }
  final ILogInRepository _logInRepository = getIt.get<ILogInRepository>();
}
