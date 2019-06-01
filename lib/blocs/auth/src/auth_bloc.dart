part of auth_bloc;

///This bloc handles all the states of the authentication
class AuthBLoc extends Bloc<AuthEvent, AuthState> {
  AnimationController btnSizeController;
  final TickerProvider vsync;

  AuthBLoc(this.vsync);
  @override
  AuthState get initialState =>
      AuthApi.user != null ? LoggedInS(AuthApi.user) : Loggedout();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginWithGoogleE) {
      yield LoggingInS();
      btnSizeController.reverse();
      try {
        final user = await AuthApi().loginWithGoogle();
        yield user != null ? LoggedInS(user) : LoginErrorS();
      } catch (err) {
        yield LoginErrorS();
      }
      btnSizeController.forward();
    }
  }

  @override
  void dispose() {
    btnSizeController.dispose();
    super.dispose();
  }
}
