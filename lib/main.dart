// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:eight_hrs_flutter/pages/home_page.dart';
import 'package:eight_hrs_flutter/pages/login_page.dart';
import 'package:eight_hrs_flutter/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bringVegetables(thaila: true);
    return MaterialApp(
      // home: HomePage(),

      //Dark Mode Theme
      // themeMode: ThemeMode.light,
      // darkTheme: ThemeData(brightness: Brightness.dark),

      //Light Mode Theme
      theme: ThemeData(primarySwatch: Colors.deepPurple),

      debugShowCheckedModeBanner: false,

      //routes
      // initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }

  bringVegetables({required bool thaila, int rupees = 100}) {
    //optional parameters {} to give the default value
    //Take cycle

    //Go to Sec 16
  }
}
