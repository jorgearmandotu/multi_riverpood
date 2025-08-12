class User {

  final String email;
  final String password;
  final String? token;
  final String? name;

  User({
    required this.email,
    required this.password,
    this.token,
    this.name,
  });

  // static User fromJson(responseData) {
  //   return User(
  //     email: responseData['email'],
  //     password: 'password',
  //     token: responseData['token'],
  //     name: responseData['name'],
  //   );
  // }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'].toString(),
      password: json['password'] ?? 'password',
      name: json['name'],
      token: json['token'],
    );
  }

}
