import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:miniproject1/services/authService.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  AuthService authService;

  SplashscreenCubit({required this.authService})
      : super(SplashscreenLoading()) {
    initialize();
  }

  void initialize() async {
    print("In splashscreen cubit");

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectivityError());
    }

    bool auth = await authService.checkSignin();

    if (auth)
      emit(Loggedin());
    else
      emit(UnAuthenticated());
  }
}
