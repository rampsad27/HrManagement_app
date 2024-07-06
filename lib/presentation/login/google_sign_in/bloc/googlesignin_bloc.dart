import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'googlesignin_event.dart';
part 'googlesignin_state.dart';

class GooglesigninBloc extends Bloc<GooglesigninEvent, GooglesigninState> {
  GooglesigninBloc() : super(GooglesigninInitial()) {
    on<GooglesigninEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
