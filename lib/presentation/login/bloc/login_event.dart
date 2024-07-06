part of 'login_bloc.dart';

sealed class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

final class LogInRequested extends LogInEvent {
  final String email;
  final String password;

  const LogInRequested({required this.email, required this.password});
}

class CheckLoggedInUser extends LogInEvent {
  @override
  List<Object> get props => [];
}

final class LogOutRequested extends LogInEvent {}

final class CheckAdminStatus extends LogInEvent {}
