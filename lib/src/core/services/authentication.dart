part of tyba.core.services;

class AuthenticationService {
  Future<FirebaseUser> loginwithGoogle() async {
    try {
      final _googleSignIn = GoogleSignIn();
      final gUser = await _googleSignIn.signIn();
      final gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.getCredential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final account = await auth.signInWithCredential(credential);
      return account.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> login(String email, String password) async {
    try {
      final account = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return account.user;
    } catch (e) {
      return null;
    }
  }

  Future<FirebaseUser> signup(
    String name,
    String email,
    String password,
  ) async {
    try {
      final account = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final info = UserUpdateInfo();
      info.displayName = name;
      account.user.updateProfile(info);
      account.user.reload();
      return account.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
