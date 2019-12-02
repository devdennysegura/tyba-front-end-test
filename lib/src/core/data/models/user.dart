part of tyba.core.data.models;

class User {
  String id;
  String name;
  String username;
  String code;
  String reference;
  User({this.id, this.name, this.username, this.code, this.reference});

  User.initial()
      : id = null,
        name = '',
        username = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['passenger_name'];
    username = json['passenger_email'];
    code = json['booking_code'];
    reference = json['booking_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['passenger_name'] = this.name;
    data['passenger_email'] = this.username;
    data['booking_code'] = this.code;
    data['booking_reference'] = this.reference;
    return data;
  }
}
