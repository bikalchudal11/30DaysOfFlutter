// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      //theme to customize the appBar
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        //theme to make your icons visible
        iconTheme: IconThemeData(color: Colors.black),
        //change the text color to black by inheriting the property of iconTheme.
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      //theme to customize the appBar
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        //theme to make your icons visible
        iconTheme: IconThemeData(color: Colors.white),
        //change the text color to black by inheriting the property of iconTheme.
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));
}
