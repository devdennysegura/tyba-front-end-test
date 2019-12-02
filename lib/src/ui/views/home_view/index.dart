part of tyba.ui.views;

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  City selectedCity;
  @override
  void initState() {
    super.initState();
  }

  void onSelectCity(City city) {
    selectedCity = city;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final settings = AppSettings.of(context);
    final constraint = BoxConstraints(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: size.width,
      maxHeight: 380.0,
    );
    return BaseView<HomeModel>(
      onModelReady: (model) => model.init(settings.projectId),
      builder: (context, model, child) => Scaffold(
        backgroundColor: gallery,
        body: LayoutBuilder(
          builder: (ctx, constraints) {
            return Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RestaurantHomeViewAppBar(onSelectCity, model),
                    SizedBox(height: 16.0),
                    RestaurantCategories(model.categories),
                    model.state == ViewState.Busy ||
                            model.restaurants == null ||
                            model.restaurants.length == 0
                        ? Container(
                            width: size.width,
                            height: 380.0,
                            child: model.state == ViewState.Busy
                                ? HomeViewLoadingState(constraint)
                                : HomeViewEmptyState(selectedCity, constraint),
                          )
                        : RestaurantList(selectedCity, model.restaurants ?? []),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('profile');
          },
          child: Icon(
            Icons.person,
            color: white,
          ),
          backgroundColor: cornflower_blue,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8.0,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.HorizontalSpaceLarge),
            height: 56.0 + padding.bottom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => print('home'),
                  icon: Icon(Icons.home, color: black50),
                ),
                IconButton(
                  onPressed: () => print('perfil'),
                  icon: Icon(Icons.find_in_page, color: black50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
