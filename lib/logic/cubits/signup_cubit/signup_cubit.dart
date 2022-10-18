import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:miniproject1/services/DBService.dart';
import 'package:miniproject1/services/authService.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  DBService dbService;
  AuthService authService;
  SignupCubit({required this.authService, required this.dbService})
      : super(SignupInitial());

  void signUp(String email, String password, String reName, String reID) async {
    emit(SignupLoad());
    bool emailExists = await dbService.emailExists(email);
    // bool emailExists = false;
    if (emailExists) {
      print("email exists signup:" + emailExists.toString());
      emit(SignUpEmailExists());
    } else {
      // bool resExists = false;
      bool resExists = await dbService.restaurantExists(reID);
      if (resExists) {
        emit(SignUpRestExist());
      } else {
        bool resCreate = await dbService.addRestraunt(reName, reID);
        // bool resCreate = true;
        if (resCreate) {
          // bool adminCreate = true;
          bool adminCreate = await dbService.addAdmin(email, reID);
          bool adminSignUp = await authService.SignUp(email, password);
          print("admin create " + adminCreate.toString());
          print("admin signUp " + adminCreate.toString());

          if (adminCreate && adminSignUp) {
            emit(SignupSuccess());
          } else {
            emit(SignupError());
          }
        } else {
          emit(SignupError());
        }
      }
    }
  }
}
