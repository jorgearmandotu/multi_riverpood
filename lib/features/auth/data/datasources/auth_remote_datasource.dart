

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multi_riverpood/core/utils/env.dart';
import 'package:multi_riverpood/models/user.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<User> login(User user) async {
    final response = await client.post(Uri.parse("${Env.baseurl}/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"email": user.email, "password": user.password}),
    );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data["data"]);
    } else {
      throw Exception("Error en Login: ${response.body}");
    }
  }

}