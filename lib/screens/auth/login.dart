import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miniproject1/logic/cubits/login_cubit/login_cubit.dart';

import '../../routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emcont = TextEditingController();
  final pwdcont = TextEditingController();

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.red)),
                    height: height / 3,
                    width: width / 1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: TextFormField(
                            controller: emcont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid)
                                  return "Invalid Email";
                                else
                                  return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Email",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                        Container(
                          child: TextField(
                            controller: pwdcont,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.key),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginError)
                        showToast("Error Occured");
                      else if (state is EmailnotExist)
                        showToast("Email Does Not Exist");
                      else if (state is LoginSucess)
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.HOME_ROUTE, (route) => false);
                    },
                    builder: (context, state) {
                      if (state is LoginError) {
                        return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                      emcont.text,
                                      pwdcont.text,
                                    );
                              }
                            },
                            child: Text("Retry"));
                      } else if (state is LoginLoad) {
                        return SpinKitRotatingCircle(
                          color: Colors.blue,
                          size: 50.0,
                        );
                      } else {
                        return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                      emcont.text,
                                      pwdcont.text,
                                    );
                              }
                            },
                            child: Text("Login"));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
