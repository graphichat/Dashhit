part of auth_bloc;

@immutable
abstract class AuthEvent {}

///Login with google
class LoginWithGoogleE extends AuthEvent {}
