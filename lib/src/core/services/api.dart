part of tyba.core.services;

class Api {
  final client;
  static const endpoint = 'https://developers.zomato.com/api/v2.1';

  Api() : client = http.Client();

  Future<FirebaseUser> me() async {
    final user = await auth.currentUser();
    return user;
  }

  Future<List<Restaurant>> getRestaurants(
    String collId,
    String apiKey,
    City city,
  ) async {
    try {
      final response = await client.get(
        '$endpoint/search?entity_id=${city.id}&entity_type=city&count=10',
        headers: {'user-key': apiKey, 'Accept': 'application/json'},
      );
      final data =
          ((json.decode(response.body)['restaurants'] ?? [])) as List<dynamic>;
      return List.from(data)
          .map((c) => Restaurant.fromJson(c['restaurant']))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Restaurant>> getNearbyRestaurants(
      String collId, String apiKey, dynamic lat, dynamic lng) async {
    try {
      final response = await client.get(
        '$endpoint/search?count=10&lat=$lat&lon=$lng',
        headers: {'user-key': apiKey, 'Accept': 'application/json'},
      );
      final data =
          ((json.decode(response.body)['restaurants'] ?? [])) as List<dynamic>;
      return List.from(data)
          .map((c) => Restaurant.fromJson(c['restaurant']))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Category>> getCategories(String apiKey) async {
    try {
      final response = await client.get(
        '$endpoint/categories',
        headers: {'user-key': apiKey, 'Accept': 'application/json'},
      );
      return ((json.decode(response.body)['categories'] ?? []) as List<dynamic>)
          .map((c) => Category.fromJson(c))
          .where((c) => !c.name.toLowerCase().contains('catching'))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<City>> getCities(String apiKey, String query) async {
    try {
      final response = await client.get(
        '$endpoint/cities?q=$query&count=10',
        headers: {'user-key': apiKey, 'Accept': 'application/json'},
      );
      return (json.decode(response.body)['location_suggestions']
              as List<dynamic>)
          .map((c) => City.fromJson(c))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
