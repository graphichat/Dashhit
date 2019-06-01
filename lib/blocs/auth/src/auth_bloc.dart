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
        yield LoginErrorS();
      }
    }
  }
}
