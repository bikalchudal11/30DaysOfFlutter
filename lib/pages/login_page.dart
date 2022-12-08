// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print, use_build_context_synchronously, unused_field

import 'package:eight_hrs_flutter/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // converting to state full cause we want change in screen
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      // We want to show our homepage after 1 sec. For that we use await future delay.
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      // using await in line 82 to make sure that the icon is default
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  height:
                      200, // Increasing height to test the single child scroll view
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userController,
                        onChanged: (value) {
                          //onChanged function helps us to give callback string
                          name = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                            hintText: "Enter username",
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'Password length should be at least 6';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),

                      // Designing our own button using container
                      Material(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: Colors.deepPurple,
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            //we can also wrap text with center widget.
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,

                            // color: Colors.deepPurple,
                            // ),
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
