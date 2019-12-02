part of  tyba.ui.widgets;

class RestaurantHomeViewAppBar extends StatelessWidget {
  final ValueChanged<City> onCityChanged;
  final HomeModel model;

  RestaurantHomeViewAppBar(this.onCityChanged, this.model);

  void checkMyLocation(BuildContext context) async {
    final valid = await checkPermission();
    if (!valid) {
      PermissionHandler permission = PermissionHandler();
      Map<PermissionGroup, PermissionStatus> map =
          await permission.requestPermissions([PermissionGroup.location]);
      if (map[PermissionGroup.location] == PermissionStatus.granted) {
        handleLocation(context);
      }
    } else {
      handleLocation(context);
    }
  }

  void handleLocation(BuildContext context) async {
    final settings = AppSettings.of(context);
    onCityChanged(null);
    final location = Location();
    final position = await location.getLocation();
    model.getNearbyRestaurants(settings.collectionId,
          settings.projectId, position.latitude, position.longitude);
  }

  void findCities(BuildContext context) {
    final settings = AppSettings.of(context);
    showSearch<City>(context: context, delegate: DataSearch())
        .then((selectedCity) {
      if (selectedCity != null) {
        onCityChanged(selectedCity);
        model.getRestaurants(
          settings.collectionId,
          settings.projectId,
          selectedCity,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(
        UIHelper.HorizontalSpaceMedium,
        padding.top + UIHelper.VerticalSpaceMedium,
        UIHelper.HorizontalSpaceMedium,
        UIHelper.VerticalSpaceSmall,
      ),
      height: 150.0 + padding.top,
      width: size.width,
      color: cornflower_blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Restaurantes',
            style: TextStyle(
                color: white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          InkResponse(
            onTap: () => findCities(context),
            child: Container(
              height: 56.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.search, color: black),
                  Text('Donde estas buscando?',
                      style: TextStyle(color: black50)),
                  IconButton(
                    onPressed: ()=>checkMyLocation(context),
                    icon: Icon(Icons.my_location, color: black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
