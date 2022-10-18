import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject1/env.dart';
import 'package:miniproject1/logic/cubits/cubit/auth_cubit.dart';
import 'package:miniproject1/logic/cubits/login_cubit/login_cubit.dart';
import 'package:miniproject1/logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:miniproject1/logic/cubits/splashscreencubit/splashscreen_cubit.dart';
import 'package:miniproject1/router.dart';
import 'package:miniproject1/services/DBService.dart';
import 'package:miniproject1/services/authService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Constants.url,
    anonKey: Constants.anonKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  final AuthService authService = AuthService();
  final DBService dbService = DBService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) =>
              SplashscreenCubit(authService: authService, dbService: dbService),
        ),
        BlocProvider(
            create: (context) =>
                LoginCubit(authService: authService, dbService: dbService)),
        BlocProvider(
          create: (context) =>
              SignupCubit(authService: authService, dbService: dbService),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
