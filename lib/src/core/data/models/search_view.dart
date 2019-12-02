part of tyba.core.data.models;

class SearchModel extends BaseModel {
  Api _api = locator<Api>();
  List<City> cities;

  Future find(String logId, String apiKey, String query) async {
    auth.currentUser().then((user) {
      db.collection('tyba-tech').document(logId).collection('logs').add({
        'type': 'search',
        'value': query,
        'user': user.uid,
      });
    });
    return await _api.getCities(apiKey, query);
  }

  Future select(String logId, String apiKey, City city) async {
    auth.currentUser().then((user) {
      db.collection('tyba-tech').document(logId).collection('logs').add({
        'type': 'select',
        'value': city.name,
        'user': user.uid,
      });
    });
  }
}
