part of tyba.ui.widgets;

class HomeViewEmptyState extends StatelessWidget {
  final City selectedCity;
  final BoxConstraints constraints;

  HomeViewEmptyState(this.selectedCity, this.constraints);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/restaurant-empty-state.png',
            height: constraints.maxHeight * 0.7,
          ),
          SizedBox(height: 16.0),
          Text(
            'No encontramos restaurantes ${selectedCity != null ? 'en ${selectedCity.name}' : 'con tu búsqueda'}',
            style: TextStyle(color: black),
          ),
        ],
      ),
    );
  }
}
