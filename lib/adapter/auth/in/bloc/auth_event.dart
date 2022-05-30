part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginAuthEvent extends AuthEvent {
  LoginAuthEvent(this.email, this.password);

  final String email;
  final String password;
}

class LogoutAuthEvent extends AuthEvent {}

class OnUserChangedEvent extends AuthEvent {
  OnUserChangedEvent(this.user);

  final User? user;
}
