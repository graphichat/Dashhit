import 'package:dashhit/UI/login_view.dart';
import 'package:flutter/material.dart';
import 'package:dashhit/UI/MainPage_View.dart';

void main() => runApp(LoginView());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
