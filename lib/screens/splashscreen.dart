import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:miniproject1/routes.dart';

import '../logic/cubits/splashscreencubit/splashscreen_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenCubit, SplashscreenState>(
      listener: (context, state) {
        if (state is Loggedin)
          Navigator.pushReplacementNamed(context, Routes.HOME_ROUTE);
        else if (state is UnAuthenticated)
          Navigator.pushReplacementNamed(context, Routes.LOGIN_ROUTE);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("SPLASH SCREEN"),
                  SizedBox(
                    height: 100,
                  ),
                  BlocBuilder<SplashscreenCubit, SplashscreenState>(
                      builder: (context, state) {
                    if (state is SplashscreenLoading)
                      return SpinKitCubeGrid(color: Colors.black);
                    else if (state is ConnectivityError)
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "There was an error connecting to Internet",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please check Connection and Restart",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    else
                      return Container();
                  }),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
