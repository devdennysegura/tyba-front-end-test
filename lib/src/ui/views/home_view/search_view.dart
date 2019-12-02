part of tyba.ui.views;

class DataSearch extends SearchDelegate<City> {
  DataSearch() : super(searchFieldLabel: 'Donde estas buscando?');

  Widget displayContent(BuildContext context, List<City> list) {
    final provider = locator<SearchModel>();
    final settings = AppSettings.of(context);
    return Container(
      color: gallery,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final item = list[index];
          return InkResponse(
            onTap: () async {
              await provider.select(
                settings.collectionId,
                settings.projectId,
                item,
              );
              Navigator.of(context).pop(item);
            },
            child: ListTile(
              leading: Image.network(
                item.image,
                height: 24.0,
              ),
              title: Text(
                item.name,
                style: TextStyle(color: black),
              ),
              subtitle: Text(
                item.country,
                style: TextStyle(color: black20),
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final theme = Theme.of(context);
    theme.textTheme.apply(bodyColor: black, displayColor: black);
    assert(theme != null);
    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final settings = AppSettings.of(context);
    final size = MediaQuery.of(context).size;
    return BaseView<SearchModel>(builder: (context, model, child) {
      return FutureBuilder(
          future: model.find(settings.collectionId, settings.projectId, query),
          builder: (ctx, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                  width: size.width,
                  color: gallery,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 250.0,
                        height: 250.0,
                        child: FlareActor(
                          "assets/anims/maps.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: 'anim',
                        ),
                      ),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return displayContent(context, snapshot.data);
                } else {
                  return Container(
                    color: gallery,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/location-empty-state.png',
                            width: size.width * 0.6),
                        SizedBox(height: 30.0),
                        Text(
                          'No encontramos ciudades con los filtros aplicados',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: black,
                          ),
                        )
                      ],
                    ),
                  );
                }
                break;
              default:
                return Container();
            }
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = recommendedCities.map((c) => City.fromJson(c)).toList();
    return displayContent(context, suggestions);
  }
}
