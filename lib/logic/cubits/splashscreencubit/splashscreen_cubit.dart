import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:miniproject1/logic/models/user.dart';
import 'package:miniproject1/services/DBService.dart';
import 'package:miniproject1/services/authService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  AuthService authService;
  DBService dbService;

  SplashscreenCubit({required this.authService, required this.dbService})
      : super(SplashscreenLoading()) {
    initialize();
  }

  void initialize() async {
    print("In splashscreen cubit");

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityError());
    }

    User? user = await authService.checkSignin();

    bool auth = user != null;

    if (auth) {
      String email = user.email!;
      Admin admin = await dbService.getUser(email);
      emit(Loggedin(admin: admin));
    } else
      emit(UnAuthenticated());
  }
}
