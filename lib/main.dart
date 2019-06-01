import 'package:flutter/material.dart';
import 'package:dashhit/UI/MainPage_View.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Hit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: MainPage(),

    );
  }
  static int _blackPrimaryValue = 0xFF4e4d4f;
  static MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(_blackPrimaryValue),
      100: Color(_blackPrimaryValue),
      200: Color(_blackPrimaryValue),
      300: Color(_blackPrimaryValue),
      400: Color(_blackPrimaryValue),
      500: Color(_blackPrimaryValue),
      600: Color(_blackPrimaryValue),
      700: Color(_blackPrimaryValue),
      800: Color(_blackPrimaryValue),
      900: Color(_blackPrimaryValue),
    },
  );
}
