part of auth_bloc;

///This bloc handles all the states of the authentication
class AuthBLoc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState =>
      AuthApi.user != null ? LoggedInS(AuthApi.user) : Loggedout();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginWithGoogleE) {
      yield LoggingInS();
      try {
        final user = await AuthApi().loginWithGoogle();
        yield user != null ? LoggedInS(user) : LoginErrorS();
      } catch (err) {
        print("blb07 "+err);
        yield LoginErrorS();
      }
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print("blb07 "+transition.nextState.runtimeType.toString());
    print("blb07 "+transition.currentState.toString());
  }
}
