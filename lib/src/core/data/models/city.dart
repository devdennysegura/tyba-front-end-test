part of tyba.core.data.models;

class City {
  num id;
  String name;
  String country;
  String image;
  City({this.id, this.name, this.country, this.image});

  City.initial()
      : id = null,
        name = '';

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country_name'];
    image = json['country_flag_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'country': this.country,
      'image': this.image,
    };
  }
}
