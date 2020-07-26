class User {
  int id;
  String username;
  String token;

  User({this.username, this.token});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
        token: data['token'],
        username: data['username'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        'token': this.token,
        'username': this.username,
      };
}
