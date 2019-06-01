import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  static FirebaseUser user;

  Future<FirebaseUser> loginWithGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();
    //If not logged in throw error
    if (googleAccount == null) {
      throw Exception('Login failed/cancelled by user.');
    }
    final googleAuth = await googleAccount.authentication;
    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
