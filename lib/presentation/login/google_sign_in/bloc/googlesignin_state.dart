part of 'googlesignin_bloc.dart';

sealed class GooglesigninState extends Equatable {
  const GooglesigninState();
  
  @override
  List<Object> get props => [];
}

final class GooglesigninInitial extends GooglesigninState {}
