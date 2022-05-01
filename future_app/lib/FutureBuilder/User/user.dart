
class User {
  int id;
  String name;
  String userName;
  String email;
  Map<String, dynamic> address;
  String phone;
  String website;
  Map<String, dynamic> company;

  User({this.id, this.name, this.userName, this.email, this.address, this.phone, this.website, this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }
}


