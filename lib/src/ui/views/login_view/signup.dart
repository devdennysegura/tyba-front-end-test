part of tyba.ui.views;

class SignUpView extends StatefulWidget {
  SignUpView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailNode = FocusNode();
  final passNode = FocusNode();
  final nameNode = FocusNode();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  void onCompleteEmail(e) {
    emailNode.unfocus();
    FocusScope.of(context).requestFocus(passNode);
  }

  void onCompleteName(e) {
    nameNode.unfocus();
    FocusScope.of(context).requestFocus(emailNode);
  }

  void onCompleteForm(e) {
    nameNode.unfocus();
    emailNode.unfocus();
    passNode.unfocus();
    final provider = locator<LoginModel>();
    loadingDialog(context);
    Timer(
      Duration(seconds: 1),
      () async {
        await provider.signup(
          nameController.text,
          emailController.text,
          passController.text,
        );
        Navigator.of(context).pop();
        if (provider.user?.uid == null)
          Toast.show('Oops ha ocurrido un error', context);
        else
          Navigator.of(context).pushReplacementNamed('home');
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  bool get validEmail => validateEmail(emailController);
  bool get validPassword =>
      !(passController.text.isNotEmpty && passController.text.length < 6);
  bool get validName =>
      !(passController.text.isNotEmpty && passController.text.length < 6);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: false,
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
                        'Create una nueva cuenta',
                        style: TextStyle(color: black, fontSize: 18.0),
                      ),
                    ),
                    UIHelper.verticalSpace(40.0),
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
                              nameNode,
                              nameController,
                              hint: 'Denny Segura',
                              label: 'Nombre',
                              type: TextInputType.text,
                              autoFocus: false,
                              action: TextInputAction.next,
                              onComplete: onCompleteName,
                              hasError: !validName,
                              errorText: 'Ingresa un nombre valido!',
                            ),
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
                              label: 'Contraseña',
                              isPassword: true,
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
                                  'Registrarse',
                                  style:
                                      TextStyle(color: white, fontSize: 16.0),
                                ),
                              ),
                            ),
                            ExtraButton(false, color: black),
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
