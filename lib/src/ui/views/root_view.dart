part of tyba.ui.views;

class RootPage extends StatefulWidget {
  RootPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    final api = locator<Api>();
    api.me().then((user) {
      if (user != null)
        Navigator.of(context).pushReplacementNamed('home');
      else
        Navigator.of(context).pushReplacementNamed('login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(),
    );
  }
}
