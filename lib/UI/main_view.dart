import 'package:dashhit/api/firebase_api.dart';
import 'package:dashhit/blocs/blocs.dart';
import 'package:dashhit/models/message.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Message> messages = [];

  MessageBloc messageBloc;

  @override
  void initState() {
    messageBloc = MessageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appWidth = MediaQuery.of(context).size.width;
    var appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: Container(
            child: Image(
              image: AssetImage('assets/images/DashBirdShadow.png'),
            ),
          ),
          backgroundColor: Colors.transparent,
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                return PopUpPageForUpload();
              },
            );
          },
        ),
        body: BlocProvider(
          bloc: messageBloc,
          child: Container(
            width: appWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background1.png'),
                  fit: BoxFit.cover),
            ),
            child: StreamBuilder<List<Message>>(
                stream: FirebaseApi().stream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) messages.addAll(snapshot.data);
                  if (messages.isNotEmpty) {
                    ListView.builder(
                      itemBuilder: (context, i) {
                        return Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        );
                      },
                      itemCount: messages.length,
                      scrollDirection: Axis.horizontal,
                    );
                  } else {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ), Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ), Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ), Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ),Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ),Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ),Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ),Container(
                          width: 86,
                          child: FlareActor(
                            'assets/flare/DashBird.flr',
                            animation: 'Idle',
                          ),
                          height: appHeight / 2,
                        ),
                      ],
                    );
                  }
                }),

//        child: Column(
//          children: <Widget>[
//            Container(
//              width:86,
//              child: FlareActor(
//                'assets/flare/DashBird.flr',
//                animation: 'Idle',
//
//              ),
//              height: appHeight / 2,
//            ),
//          ],
//        ),
          ),
        ));
  }
}

// class PopUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appWidth = MediaQuery.of(context).size.width;
//     return Container(
//       child: AlertDialog(
//         shape: ShapeBorder.lerp(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(appWidth / 25)),
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(appWidth / 25)),
//             appWidth / 400),
//         title: Center(child: Text('Dashhit')),
//         content: Column(
//           children: <Widget>[
//             Text('Hi'),
//             Text('Hi'),
//             Text('Hi'),
//             Text('Hi'),
//           ],
//         ),
//       ),
//     );
//   }
// }

class PopUpPageForUpload extends StatelessWidget {
  var _picture;

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
        contentPadding: EdgeInsets.all(appWidth / 50),
        content: Container(
          height: appHeight / 4.2,
          child: Row(
            children: <Widget>[
              Card(
                shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appWidth / 25)),
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appWidth / 25)),
                    appWidth / 400),
                elevation: appWidth / 40,
                child: GestureDetector(
                  onTap: () async {
                    var _picture = await ImagePicker.pickImage(
                      source: ImageSource.camera,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ImageView(_picture);
                    }));
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          size: appWidth / 3,
                          color: Colors.blue,
                        ),
                        Container(
                          child: Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: appWidth / 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(appWidth / 25),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    left: appWidth / 30,
                    bottom: appWidth / 90,
                    top: appWidth / 90),
                shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appWidth / 25)),
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appWidth / 25)),
                    appWidth / 400),
                elevation: appWidth / 40,
                child: GestureDetector(
                  onTap: () async {
                    var _picture = await ImagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ImageView(_picture);
                    }));
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.image,
                          size: appWidth / 3,
                          color: Colors.blue,
                        ),
                        Container(
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: appWidth / 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(appWidth / 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageView extends StatefulWidget {
  var picture;

  ImageView(this.picture);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  MessageBloc messageBloc = MessageBloc();

  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: BlocProvider(
          bloc: messageBloc,
          child: Column(
            children: <Widget>[
              Container(
                height: appHeight / 1.5,
                margin: EdgeInsets.only(top: appHeight / 5),
                child: Center(
                    child: Image(
                  image: FileImage(widget.picture),
                  fit: BoxFit.cover,
                )),
              ),
              Container(
                width: appHeight / 2,
                height: appHeight / 15,
                child: RaisedButton(
                  child: Text(
                    'Post',
                    style:
                        TextStyle(fontSize: appHeight / 25, color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<MessageBloc>(context).dispatch(SendImageMessageE(widget.picture));
                    Navigator.pop(context);
                  },
                  shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appWidth / 25)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appWidth / 25)),
                      appWidth / 400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
