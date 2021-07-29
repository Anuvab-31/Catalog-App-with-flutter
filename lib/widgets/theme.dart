import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  // static ThemeData darkTheme(BuildContext context) => ThemeData(
  //     brightness: Brightness.dark,
  //     fontFamily: GoogleFonts.poppins().fontFamily,
  //     cardColor: Colors.black,
  //     canvasColor: darkCreamColor,
  //     buttonColor: lightBluishColor,
  //     accentColor: Colors.white,
  //     appBarTheme: AppBarTheme(
  //         color: Colors.white,
  //         elevation: 0,
  //         iconTheme: IconThemeData(color: Colors.white),
  //         textTheme: Theme.of(context).textTheme));

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey;
  static Color lightBluishColor = Colors.indigo;
  static Color darkBluishColor = Color(0xff403b58);
}
