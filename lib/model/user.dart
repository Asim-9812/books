

class User {

  final String token;
  final String email;
  final String username;
  final String id;

  User({
    required this.token,
    required this.username,
    required this.email,
    required this.id

});

  factory User.fromJson(Map<String,dynamic> json){

    return User(
        token: json['token'],
        username: json['username'],
        email: json['email'],
        id: json['id']
    );

  }


}