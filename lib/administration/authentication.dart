import 'dart:async';
import 'dart:convert';
import '../services/helper.dart';
import '../services/constants.dart';

Future<bool> login(String username, String password, bool rememberMe) async {
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});

  final response = await restPost(API + "authenticate", body);

  setPrefs(TOKEN,json.decode(response)["id_token"]);
  return true;
}
