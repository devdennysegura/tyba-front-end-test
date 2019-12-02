part of  tyba.ui.widgets;

class SocialNetworkButton extends StatelessWidget {
  final Function callback;
  final String name;
  final String iconName;
  final IconData icon;

  SocialNetworkButton(this.callback, this.name, {this.iconName, this.icon});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.6,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.HorizontalSpaceMedium,
            vertical: UIHelper.VerticalSpaceSmall),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        onPressed: callback,
        color: white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icon != null
                ? Icon(icon, color: black, size: 24.0)
                : Image.asset(
                    'assets/images/${iconName ?? name.toLowerCase()}-icon.png',
                    height: 24.0,
                    width: 32.0,
                  ),
            Text('Ingreso con $name', style: TextStyle(color: black)),
            Icon(Icons.chevron_right, color: black)
          ],
        ),
      ),
    );
  }
}
