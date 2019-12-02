part of tyba.core.data.models;

class HomeModel extends BaseModel {
  Api _api = locator<Api>();
  List<Category> categories;
  List<Restaurant> restaurants;

  void init(String apiKey) async {
    categories = await _api.getCategories(apiKey);
    setState(ViewState.Idle);
    notifyListeners();
  }

  void getRestaurants(String collId, String apiKey, City city) async {
    restaurants?.clear();
    setState(ViewState.Busy);
    final response = await _api.getRestaurants(collId, apiKey, city);
    restaurants = List.from(response);
    setState(ViewState.Idle);
  }

  void getNearbyRestaurants(
    String collId,
    String apiKey,
    double lat,
    double lng,
  ) async {
    restaurants?.clear();
    setState(ViewState.Busy);
    auth.currentUser().then((user) {
      db.collection('tyba-tech').document(collId).collection('logs').add({
        'type': 'search',
        'value': 'Mi ubicación',
        'user': user.uid,
      });
    });
    final response = await _api.getNearbyRestaurants(collId, apiKey, lat, lng);
    restaurants = List.from(response);
    setState(ViewState.Idle);
  }
}
