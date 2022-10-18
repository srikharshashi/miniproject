import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:miniproject1/services/DBService.dart';
import 'package:miniproject1/services/authService.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authService, required this.dbService})
      : super(LoginInitial());

  DBService dbService;
  AuthService authService;

  void login(String email, String password) async {
    emit(LoginLoad());
    try {
      bool emilExists = await dbService.emailExists(email);
      if (emilExists) {
        bool auth = await authService.signInWithEmail(email, password);
        if (auth) {
          emit(LoginSucess());
        } else {
          emit(LoginError());
        }
      } else {
        emit(EmailnotExist());
      }
    } catch (e) {
      emit(LoginError());
    }
  }
}
