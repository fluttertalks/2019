class User {
  String _id;
  String name;
  String email;

  User(String _id, String name, String email) {
    this._id = _id;
    this.name = name;
    this.email = email;
  }

  User.fromJson(Map json)
      : _id = json['_id'],
        name = json['name'],
        email = json['email'];


  Map<String, dynamic > toJson() {
    return {'_id': _id, 'name': name, 'email': email};
  }
}