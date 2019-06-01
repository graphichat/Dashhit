import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _Mainpage createState() => new _Mainpage();
}

class _Mainpage extends State<MainPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("blb07 hi");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Container(
              child: Text("Dash Hit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Container(
              child: Image.asset("assets/images/dash.png"),
            ),
            GestureDetector(
              onTap: (){logIn();},
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Text("Sign In",style: TextStyle(fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );


  }

  void logIn() {

  }
}
