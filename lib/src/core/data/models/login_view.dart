part of tyba.core.data.models;

class LoginModel extends BaseModel {
  FirebaseUser user;

  AuthenticationService authService = locator<AuthenticationService>();

  Future loginWithGoogle() async {
    setState(ViewState.Busy);
    user = await authService.loginwithGoogle();
    setState(ViewState.Idle);
    if (user == null) await auth.signOut();
    notifyListeners();
  }

  Future signIn(String email, String code) async {
    setState(ViewState.Busy);
    user = await authService.login(email, code);
    setState(ViewState.Idle);
    if (user == null) await auth.signOut();
    notifyListeners();
  }

  Future signup(String name, String email, String pass) async {
    setState(ViewState.Busy);
    user = await authService.signup(name, email, pass);
    setState(ViewState.Idle);
    if (user == null) await auth.signOut();
    notifyListeners();
  }
}
