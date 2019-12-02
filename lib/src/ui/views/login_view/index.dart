part of tyba.ui.views;

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  void signIn() {
    Navigator.of(context).pushNamed('signin');
  }

  void googleSignIn() async {
    final provider = locator<LoginModel>();
    await provider.loginWithGoogle();
    if (provider.user?.uid != null)
      Navigator.of(context).pushReplacementNamed('home');
    else
      Toast.show('Oops, ocurrió un error', context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipPath(
              child: Container(
                color: cornflower_blue.withOpacity(0.9),
                height: size.height,
                width: size.width,
              ),
              clipper: LoginBackground(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UIHelper.HorizontalSpaceLarge,
                vertical: padding.top + UIHelper.VerticalSpaceMedium,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset('assets/images/logo.png', height: 80.0),
                  ),
                  UIHelper.verticalSpace(80.0),
                  Text(
                    'Hola!',
                    style: TextStyle(
                        color: black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      'Selecciona una opcion de ingreso con una cuenta existente o crea una nueva cuenta',
                      style: TextStyle(color: black20, fontSize: 16.0),
                    ),
                  ),
                  UIHelper.verticalSpace(100.0),
                  Center(
                    child: SocialNetworkButton(
                      model.state == ViewState.Busy ? null : googleSignIn,
                      'Google',
                      iconName: 'google',
                    ),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  Center(
                    child: SocialNetworkButton(
                      signIn,
                      'Email',
                      icon: Icons.email,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  ExtraButton(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
