part of  tyba.ui.widgets;

class ExtraButton extends StatelessWidget {
  final bool signup;
  final Color color;

  ExtraButton(this.signup, {this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: Text(
            signup ? 'Aun no tienes una cuenta?' : 'Ya tienes una cuenta?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color ?? white,
            ),
          ),
        ),
        InkResponse(
          onTap: () {
            Navigator.of(context).pushNamed(signup ? 'signup' : 'signin');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: Text(
              signup ? 'Registrate' : 'Ingresar',
              style: TextStyle(
                color: color ?? white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
