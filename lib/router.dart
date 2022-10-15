import 'package:flutter/material.dart';
import 'package:miniproject1/routes.dart';
import 'package:miniproject1/screens/home.dart';
import 'package:miniproject1/screens/login.dart';
import 'package:miniproject1/screens/splashscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.LOGIN_ROUTE:
        return MaterialPageRoute(builder: (context) => Login());
      case Routes.HOME_ROUTE:
        return MaterialPageRoute(builder: (context) => Home());

      default:
        return null;
    }
  }
}
