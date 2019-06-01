import 'package:flutter/material.dart';
import 'package:dashhit/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => new _LoginView();
}

class _LoginView extends State<LoginView> with SingleTickerProviderStateMixin {
  AuthBLoc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = AuthBLoc(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(
                "assets/images/Group.png",
                width: 200,
              ),
            ),
            RaisedButton(
              child: BlocBuilder(
                bloc: authBloc,
                builder: (BuildContext context, AuthState state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 360),
                        crossFadeState: state is LoggingInS
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild:
                            Image.asset('assets/images/g-logo.gif', height: 32),
                        secondChild: Image.asset(
                          'assets/images/google_icon.png',
                          height: 32,
                        ),
                      ),
                      Image.asset(
                        'assets/images/google_icon.png',
                        height: 28,
                      ),
                      Container(
                        width: 186,
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              onPressed: () => authBloc.dispatch(LoginWithGoogleE()),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}
