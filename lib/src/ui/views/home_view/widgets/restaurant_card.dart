part of tyba.ui.widgets;

class RestaurantCard extends StatelessWidget {
  final Restaurant info;
  RestaurantCard(this.info);

  Widget navButton(Function cb, String text, bool enabled) {
    return Expanded(
      flex: 1,
      child: InkResponse(
        onTap: cb,
        child: Container(
          alignment: Alignment.center,
          height: 48.0,
          child: Text(
            text,
            style: TextStyle(color: enabled ? black : black20),
          ),
        ),
      ),
    );
  }

  void callToRestaurant() async {
    await launch('tel:${info.phone}');
  }

  void openWebPage(BuildContext context) async {
    if (await canLaunch(info.url)) {
      await launch(info.url, enableJavaScript: true, forceWebView: true);
    } else {
      Toast.show('No se puede visualizar la página web', context);
    }
  }

  void openMap(BuildContext context) async {
    Completer<GoogleMapController> _controller = Completer();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(
        num.tryParse(info.location['lat']),
        num.tryParse(
          info.location['lng'],
        ),
      ),
      zoom: 14.4746,
    );
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    markers[MarkerId(info.name)] = Marker(
      markerId: MarkerId(info.name),
      position: _kGooglePlex.target,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: cornflower_blue,
            title: Text(info.name),
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(markers.values),
          ),
        ),
      ),
    );
  }

  void checkMyLocation(BuildContext context) async {
    final valid = await checkPermission();
    if (!valid) {
      PermissionHandler permission = PermissionHandler();
      Map<PermissionGroup, PermissionStatus> map =
          await permission.requestPermissions([PermissionGroup.location]);
      if (map[PermissionGroup.location] == PermissionStatus.granted) {
        openMap(context);
      }
    } else {
      openMap(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: white,
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 164.0,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(info.image.first),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.fromLTRB(
              UIHelper.HorizontalSpaceMedium,
              UIHelper.VerticalSpaceSmall,
              UIHelper.HorizontalSpaceMedium,
              0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        info.name,
                        style: TextStyle(
                          color: black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0),
                    RatingBarIndicator(
                      rating: info.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    navButton(
                      callToRestaurant,
                      'Llamar',
                      info.phone != null,
                    ),
                    navButton(
                      () => openWebPage(context),
                      'Visitar Web',
                      info.url != null,
                    ),
                    navButton(
                      () => checkMyLocation(context),
                      'Ver Mapa',
                      info.location != null,
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
