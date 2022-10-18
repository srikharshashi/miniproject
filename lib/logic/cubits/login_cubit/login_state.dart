part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState{}

class LoginSucess extends LoginState{}

class LoginError extends LoginState{}

class EmailnotExist extends LoginState{}