part of auth_bloc;

@immutable
abstract class AuthState {}

///Logging in
class LoggingInS extends AuthState {}

///Logged in
class LoggedInS extends AuthState {
  final FirebaseUser user;

  LoggedInS(this.user);
}

///Could not login
class LoginErrorS extends AuthState {}

///User `NOT` Logged in yet. OR just logged out
class Loggedout extends AuthState {}
