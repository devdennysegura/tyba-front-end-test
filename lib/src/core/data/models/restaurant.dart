part of tyba.core.data.models;

class Restaurant {
  String id;
  String name;
  String address;
  List<String> image;
  String url;
  num rating;
  String phone;
  List<String> schedule;
  Map<String, dynamic> location;

  Restaurant(
      {this.id,
      this.name,
      this.address,
      this.image,
      this.rating,
      this.phone,
      this.schedule,
      this.location});

  Restaurant.initial()
      : id = null,
        name = '';

  Restaurant.fromJson(Map<String, dynamic> json) {
    address = json['location']['address'];
    image = List.from(json['photos'] ?? []).map((img) {
      return img['photo']['url'].toString();
    }).toList();
    rating = num.tryParse(json['user_rating']['aggregate_rating']);
    phone = json['phone_numbers'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
    location = {
      'lat': json['location']['latitude'],
      'lng': json['location']['longitude']
    };
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'name': this.name,
      'address': this.address,
      'image': this.image,
      'rating': this.rating,
      'phone': this.phone,
      'schedule': this.schedule,
      'geo': this.location,
    };
  }
}
