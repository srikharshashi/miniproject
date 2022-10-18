import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoggedOut());

  void login(Admin admin) {
    emit(LoggedIn(admin: admin));
  }
}
