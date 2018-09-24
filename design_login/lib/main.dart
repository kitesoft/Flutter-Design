import 'package:design_login/Home/HomePage.dart';
import 'package:design_login/LoginPage/LoginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: {
        "/login":(BuildContext context) => LoginPage(),
        "/home":(BuildContext context) => HomePage()
      },
    );
  }
}

