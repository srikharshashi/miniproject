import 'package:flutter/material.dart';

import '../routes.dart';

class FrontPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.LOGIN_ROUTE);
                  },
                  child: Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.SIGNUP_ROUTE);
                  },
                  child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
