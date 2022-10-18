import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miniproject1/logic/cubits/signup_cubit/signup_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey1 = GlobalKey<FormState>();
  final emcont = TextEditingController();
  final pwdcont = TextEditingController();
  final renamecont = TextEditingController();
  final cpwdcont = TextEditingController();
  final reIDcont = TextEditingController();

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: height,
                width: width,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "SignUp",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: height / 2,
                      width: width / 1.2,
                      margin: EdgeInsets.only(top: 50, bottom: 50),
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
                            child: TextFormField(
                              controller: pwdcont,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else
                                  return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.key),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value != pwdcont.text) {
                                  return "Passwords Do not Match";
                                } else
                                  return null;
                              },
                              controller: cpwdcont,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                prefixIcon: Icon(Icons.key),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else
                                  return null;
                              },
                              controller: renamecont,
                              decoration: InputDecoration(
                                labelText: "Restaurant Name",
                                prefixIcon: Icon(Icons.food_bank),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else
                                  return null;
                              },
                              controller: reIDcont,
                              decoration: InputDecoration(
                                labelText: "Restaurant ID",
                                prefixIcon: Icon(Icons.insert_drive_file),
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<SignupCubit, SignupState>(
                      listener: (context, state) {
                        if (state is SignUpEmailExists)
                          showToast("Email Exists Already");
                        else if (state is SignUpRestExist)
                          showToast("Restraunt Already Exists");
                        else if (state is SignupError)
                          showToast("There was an error");
                        else if (state is SignupSuccess)
                          showToast("Sign Up Success");
                      },
                      builder: (context, state) {
                        if (state is SignupError) {
                          return ElevatedButton(
                              onPressed: () {
                                if (_formKey1.currentState!.validate()) {
                                  context.read<SignupCubit>().signUp(
                                      emcont.text,
                                      pwdcont.text,
                                      renamecont.text,
                                      reIDcont.text);
                                }
                              },
                              child: Text("Rerty"));
                        } else if (state is SignupLoad) {
                          return SpinKitRotatingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          );
                        } else {
                          return ElevatedButton(
                              onPressed: () {
                                if (_formKey1.currentState!.validate()) {
                                  context.read<SignupCubit>().signUp(
                                      emcont.text,
                                      pwdcont.text,
                                      renamecont.text,
                                      reIDcont.text);
                                }
                              },
                              child: Text("Sign Up"));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
