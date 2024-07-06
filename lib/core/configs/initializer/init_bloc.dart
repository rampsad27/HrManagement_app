import 'package:hr_app_redo/core/service_locator/service_locator.dart';
import 'package:hr_app_redo/presentation/login/bloc/login_bloc.dart';
import 'package:hr_app_redo/presentation/login/google_sign_in/bloc/googlesignin_bloc.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';

abstract class InitBloc {
  static void init() {
    getIt.registerSingleton<UserDetailsBloc>(UserDetailsBloc());
    getIt.registerSingleton<LogInBloc>(LogInBloc());
    getIt.registerSingleton<GooglesigninBloc>(GooglesigninBloc());
  }
}
