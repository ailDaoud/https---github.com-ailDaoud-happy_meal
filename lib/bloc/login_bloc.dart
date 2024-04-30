import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Repository/LoginRep.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<bbbbb>(bbbb);
    on<SetNumper>(fetchotpp);
    on<SetVarity>(sendotp);
  }
  FutureOr<void> fetchotpp(SetNumper event, Emitter<LoginState> emit) async {
    bool sucsses = await Auth.fetchotp(event.number);
    if (sucsses) {
      emit(LogininitstateSucsess());
    } else {
      emit(LogininitstateError(errormessage: sucsses.toString()));
    }
  }

  FutureOr<void> sendotp(SetVarity event, Emitter<LoginState> emit) async {
    bool sucsses = await Auth.setotp(event.number, event.otp);
    if (sucsses) {
      emit(VarityinitStateSucsess());
    } else {
      emit(VarityinitStateError(errormessage: sucsses.toString()));
    }
  }
  FutureOr<void>bbbb(bbbbb event,Emitter<LoginState> emit){
    emit(Varityinit());
  }

}
