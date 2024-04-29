part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogininitstateSucsess extends LoginState {}

class LogininitstateError extends LoginState {
  final String errormessage;

  LogininitstateError({required this.errormessage});
}

class VarityinitStateSucsess extends LoginState {}

class VarityinitStateError extends LoginState {
  final String errormessage;

  VarityinitStateError({required this.errormessage});
}

class SetNameyinitSucsess extends LoginState {}

class LoginNameError extends LoginState {
  final String errormessage;

  LoginNameError({required this.errormessage});
}
