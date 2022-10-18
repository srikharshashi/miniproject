part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class LoggedOut extends AuthState {}

class LoggedIn extends AuthState {
  Admin admin;
  LoggedIn({required this.admin});
}
