part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Initialevent extends LoginEvent {}

class SetNumper extends LoginEvent {
  final String number;

  SetNumper({required this.number});
}

class SetVarity extends LoginEvent {
  final String number;
  final String otp;

  SetVarity({required this.number, required this.otp});
}

class SetName extends LoginEvent {
  final String name;

  SetName({required this.name});
}
