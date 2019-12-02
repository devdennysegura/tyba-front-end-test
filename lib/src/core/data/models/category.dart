part of tyba.core.data.models;

class Category {
  num id;
  String name;
  String image;
  Category({this.id, this.name, this.image});

  Category.initial()
      : id = null,
        name = '';

  Category.fromJson(Map<String, dynamic> json) {
    id = json['categories']['id'];
    name = json['categories']['name'];
    image = '${appIcons}category_$id.png?fit=around|88:88&crop=88:88;*,*';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
    };
  }
}
