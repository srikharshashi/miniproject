import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../logic/cubits/cubit/auth_cubit.dart';
import '../routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();
                  Navigator.pushReplacementNamed(context, Routes.FRONT_PAGE);
                },
                icon: Icon(Icons.power_settings_new))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoggedIn) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Welcome " + state.admin.restName,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: height / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width / 2.5,
                                height: height / 6,
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 240, 237, 237),
                                    elevation: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.table,
                                          size: 30,
                                        ),
                                        Text(
                                          "Add Table",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.5,
                                height: height / 6,
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 240, 237, 237),
                                    elevation: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.tableList,
                                          size: 30,
                                        ),
                                        Text(
                                          "View Tables",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: height / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width / 2.5,
                                height: height / 6,
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 240, 237, 237),
                                    elevation: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.bowlFood,
                                          size: 30,
                                        ),
                                        Text(
                                          "View Menu",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.5,
                                height: height / 6,
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 240, 237, 237),
                                    elevation: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.cutlery,
                                          size: 30,
                                        ),
                                        Text(
                                          "Add Dishes",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: height / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 2,
                                height: height / 6,
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 240, 237, 237),
                                    elevation: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.table,
                                          size: 30,
                                        ),
                                        Text(
                                          "Current Orders",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Center(child: Text("Wrong Flow")),
                );
              }
            },
          ),
        ));
  }
}
