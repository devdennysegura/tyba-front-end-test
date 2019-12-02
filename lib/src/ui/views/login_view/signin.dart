part of tyba.ui.views;

class SignInView extends StatefulWidget {
  SignInView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailNode = FocusNode();
  final passNode = FocusNode();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void onCompleteEmail(e) {
    emailNode.unfocus();
    FocusScope.of(context).requestFocus(passNode);
  }

  void onCompleteForm(e) async {
    emailNode.unfocus();
    passNode.unfocus();
    if (emailController.text.isEmpty || !validEmail || !validPassword) {
      Toast.show('Completa los campos', context);
      return;
    } else {
      final provider = locator<LoginModel>();
      loadingDialog(context);
      Timer(
        Duration(seconds: 1),
        () async {
          await provider.signIn(emailController.text, passController.text);
          Navigator.of(context).pop();
          if (provider.user?.uid == null)
            Toast.show('Usuario/Contraseña incorrectos', context);
          else
            Navigator.of(context).pushReplacementNamed('home');
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  bool get validEmail => validateEmail(emailController);
  bool get validPassword =>
      !(passController.text.isNotEmpty && passController.text.length < 6);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
                top: padding.top,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                  color: black,
                )),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child:
                          Image.asset('assets/images/logo.png', height: 80.0),
                    ),
                    UIHelper.verticalSpace(40.0),
                    Text(
                      'Hola!',
                      style: TextStyle(
                          color: black,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        'Ingresa con tu cuenta',
                        style: TextStyle(color: black, fontSize: 18.0),
                      ),
                    ),
                    UIHelper.verticalSpace(60.0),
                    Material(
                      elevation: 2.0,
                      shadowColor: black20,
                      color: white,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: UIHelper.HorizontalSpaceLarge,
                          vertical: UIHelper.VerticalSpaceMedium,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SignInInput(
                              emailNode,
                              emailController,
                              hint: 'test@email.com',
                              label: 'Email',
                              type: TextInputType.emailAddress,
                              autoFocus: false,
                              action: TextInputAction.next,
                              onComplete: onCompleteEmail,
                              hasError: !validEmail,
                              errorText: 'Ingrese un email válido!',
                            ),
                            SignInInput(
                              passNode,
                              passController,
                              hint: '******',
                              isPassword: true,
                              label: 'Contraseña',
                              type: TextInputType.text,
                              autoFocus: false,
                              action: TextInputAction.done,
                              onComplete: onCompleteForm,
                              hasError: !validPassword,
                              errorText: 'Minimo 8 caracteres!',
                            ),
                            Center(
                              child: RaisedButton(
                                onPressed: () => onCompleteForm(null),
                                child: Text(
                                  'Ingresar',
                                  style:
                                      TextStyle(color: white, fontSize: 16.0),
                                ),
                              ),
                            ),
                            ExtraButton(true, color: black),
                            UIHelper.verticalSpaceSmall(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
