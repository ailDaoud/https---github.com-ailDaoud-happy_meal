part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogininitstateSucsess extends LoginState {}

class LogininitstateError extends LoginState {
  final String errormessage;

  LogininitstateError({required this.errormessage});
}

class Varityinit extends LoginState {}

class VarityinitStateSucsess extends LoginState {}

class VarityinitStateError extends LoginState {
  final String errormessage;

  VarityinitStateError({required this.errormessage});
}

class SetNameinitSucsess extends LoginState {}

class SetNameNameError extends LoginState {
  final String errormessage;

  SetNameNameError({required this.errormessage});
}

class Getcategoriessucsess extends LoginState {}

class GetcategoriesFailed extends LoginState {}
