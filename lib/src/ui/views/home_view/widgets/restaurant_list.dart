part of tyba.ui.widgets;

class RestaurantList extends StatelessWidget {
  final List<Restaurant> data;
  final City city;
  RestaurantList(this.city, this.data);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.HorizontalSpaceMedium),
          child: Text(
            'Restaurantes en ${city?.name?? 'tu Ubicación'}',
            style: TextStyle(color: black, fontSize: 24.0),
          ),
        ),
        SizedBox(height: 16.0),
        ListView.separated(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.HorizontalSpaceMedium),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (ctx, index) {
            return SizedBox(height: 12.0);
          },
          itemCount: data.length,
          itemBuilder: (ctx, index) {
            final restaurant = data[index];
            return RestaurantCard(restaurant);
          },
        ),
      ],
    );
  }
}
