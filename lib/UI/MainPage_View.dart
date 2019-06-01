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
              margin: EdgeInsets.only(top: 50),
              child: Image.asset("assets/images/Group.png",width: 200,),

            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              width: 200,
              child: Card(
                color: Colors.white,
                child: FlatButton.icon(
                    onPressed: (){logIn();},
                    icon: Image(image: new AssetImage("assets/images/g-logo.gif"),width: 40),
                    label: Text("Sign In",style: TextStyle(fontSize: 18),)
                ),
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
