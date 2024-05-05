import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Models/caregoriesmodel.dart';
import 'package:flutter_application_1/Repository/LoginRep.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SetName>(sendname);
    on<SetNumper>(fetchotpp);
    on<SetVarity>(sendotp);
    on<GetCategories>(getCategories);
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

  FutureOr<void> sendname(SetName event, Emitter<LoginState> emit) async {
    bool sucsses = await Auth.setname(event.name);
    if (sucsses) {
      emit(SetNameinitSucsess());
    } else {
      emit(SetNameNameError(errormessage: sucsses.toString()));
    }
  }

  FutureOr<void> getCategories(
      GetCategories event, Emitter<LoginState> emit) async {
    Categoryy categoryy=Categoryy();
    try {
      categoryy=await Auth().fetchcategories();
      if(categoryy==null){
        emit(LoadingCategories());
      }
      else{
      emit(Cetcategoriessucsess(categoryy));}
    } catch (e) {
      emit(CetcategoriesFailed("mmmmmmmmmmmmmmmmmmm"));
    }
  }
}
