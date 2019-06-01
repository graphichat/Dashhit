import 'package:dashhit/UI/main_view.dart';
import 'package:flutter/material.dart';
import 'package:dashhit/blocs/blocs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _Mainpage createState() => new _Mainpage();
}

class _Mainpage extends State<LoginView>{
  AuthBLoc authBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = AuthBLoc();
    initLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: authBloc,
        listener: (context,state){
          if(state is LoggedInS){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return MainPage();
            }));
          }
        },
        child: Center(
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
                      onPressed: (){
                      logIn();
                        //authBloc.dispatch(LoginWithGoogleE());
                      },
                      icon: Image(image: new AssetImage("assets/images/g-logo.gif"),width: 40),
                      label: Text("Sign In",style: TextStyle(fontSize: 18),)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );


  }

  void logIn() {
    authBloc.dispatch(LoginWithGoogleE());
//doLogin();
  }
  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  initLogin() {
    print("blb07 processing");
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      if (account != null) {
        // user logged
        print("blb07 logged  in");
        print("blb07 "+account.displayName);
      } else {
        // user NOT logged
        print("blb07 not logged");
      }
    });
    _googleSignIn.signInSilently().whenComplete(() => {
          //dismissLoading();
    });
  }
  doLogin() async {
    //showLoading();
    print("blb07 siging");
    await _googleSignIn.signIn();

  }
}
