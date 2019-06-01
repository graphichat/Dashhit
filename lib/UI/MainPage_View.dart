import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return PopUpPageForUpload();
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle,size: appWidth/10,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.info,size: appWidth/10,),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Container(
      ),
    );
  }
}

class PopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      child: AlertDialog(
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(appWidth / 25)),
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(appWidth / 25)),
            appWidth / 400),
        title: Center(child: Text('Dashhit')),
        content: Column(
          children: <Widget>[
            Text('Hi'),
            Text('Hi'),
            Text('Hi'),
            Text('Hi'),
          ],
        ),
      ),
    );
  }
}

class PopUpPageForUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Container(
      
      child: AlertDialog(
          shape: ShapeBorder.lerp(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appWidth / 25)),
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appWidth / 25)),
      appWidth / 400),
          content: Container(
            height: appHeight/2,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column()
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}


