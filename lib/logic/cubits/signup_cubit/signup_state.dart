part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoad extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupError extends SignupState {}

class SignUpEmailExists extends SignupState {}

class SignUpRestExist extends SignupState {}
