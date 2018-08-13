import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class LoginVm {

  final String username;
  final String password;
  final bool rememberMe;

  const LoginVm({
    @required this.username,
    @required this.password,
    @required this.rememberMe,
  })  : assert(username != null),
        assert(password != null),
        assert(rememberMe != null);



  factory LoginVm.fromJson(Map<String, dynamic> json) {
    return LoginVm(
        username: json['username'],
        password: json['password'],
        rememberMe: json['rememberMe'],
    );
  }

  String toJson(String username, String password, bool rememberMe) {
    Map map = {
      'username': username,
      'password': password,
      'rememberMe': rememberMe
    };
    return json.encode(map);
  }
}
