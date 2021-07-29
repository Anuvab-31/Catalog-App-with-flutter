import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
//import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      home: LoginPage(),
    );
  }
}
