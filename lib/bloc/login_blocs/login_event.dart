part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent{
  const EmailChanged({required this.email});

  final String email;
  @override
  List<Object?> get props => [email];
}

class EmailUnfocused extends LoginEvent{}

class PasswordChanged extends LoginEvent{
  const PasswordChanged({required this.password});

  final String password;
  @override
  List<Object?> get props => [password];
}

class PasswordUnfocused extends LoginEvent{}

class LoginApi extends LoginEvent{}