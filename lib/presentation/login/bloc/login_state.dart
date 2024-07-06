part of 'login_bloc.dart';

sealed class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

final class LogInInitial extends LogInState {}

final class LogInLoadInProgress extends LogInState {}

final class LogInFailure extends LogInState {
  final String message;
  const LogInFailure({required this.message});
}

final class LogInSuccess extends LogInState {
  final String message;
  const LogInSuccess({required this.message});
}

final class Authenticated extends LogInState {}

final class UnAuthenticated extends LogInState {}

final class LogoutSuccess extends LogInState {
  final String logoutSuccessMessage;
  const LogoutSuccess({
    required this.logoutSuccessMessage,
  });

  @override
  List<Object> get props => [logoutSuccessMessage];
}

// class AdminStatusChecked extends LogInState {
//   final bool isAdmin;

//   const AdminStatusChecked({required this.isAdmin});

//   @override
//   List<Object> get props => [isAdmin];
// }
