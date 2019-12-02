part of tyba.ui.views;

class ProfileView extends StatefulWidget {
  ProfileView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() { 
    locator<ProfileModel>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final settings = AppSettings.of(context);
    return BaseView<ProfileModel>(
      onModelReady: (model) => model.init(settings.collectionId),
      builder: (context, model, child) => Scaffold(
        backgroundColor: cornflower_blue,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: padding.top,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                ),
              ),
            ),
            Positioned(
              top: (size.height * 0.10) + padding.top,
              child: Material(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Container(
                  height: (size.height * 0.90 - padding.top),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: padding.top + UIHelper.VerticalSpaceLarge),
                      Image.asset('assets/images/logo.png', height: 100.0),
                      SizedBox(height: UIHelper.VerticalSpaceLarge),
                      Text(
                        model.connectedUser['name'] ?? '',
                        style: TextStyle(
                          color: black,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        model.connectedUser['email'] ?? '',
                        style: TextStyle(
                          color: black20,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: UIHelper.VerticalSpaceSmall),
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(
                          builder: (ctx, constraints) {
                            return Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.logs.length,
                                itemBuilder: (context, index) {
                                  final log = model.logs[index];
                                  return ListTile(
                                    leading: Icon(Icons.map, color: black),
                                    title: Text(
                                      log['value'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      log['type'] == 'select'
                                          ? 'Filtro por ciudad'
                                          : 'Filtro de ciudad',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: black20,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await auth.signOut();
            Navigator.of(context).pushReplacementNamed('login');
          },
          child: Icon(
            Icons.exit_to_app,
            color: white,
          ),
          backgroundColor: cornflower_blue,
        ),
      ),
    );
  }
}
