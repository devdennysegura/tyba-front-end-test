part of  tyba.ui.widgets;

class RestaurantCategories extends StatelessWidget {
  final List<Category> data;
  RestaurantCategories(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.HorizontalSpaceMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Categorias',
            style: TextStyle(
              color: black,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 120.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (c, si) => SizedBox(width: 16.0),
              itemCount: data?.length ?? 0,
              itemBuilder: (ctx, i) {
                final item = data[i];
                return Column(
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 80.0,
                      alignment: Alignment.center,
                      child: Image.network(item.image),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: black20,
                            blurRadius: 4,
                            spreadRadius: -1.0,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.center,
                      width: 100.0,
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: black),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
