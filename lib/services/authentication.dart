import 'dart:async';
import 'dart:convert';
import 'helper.dart' as helper;

Future<bool> login(String username, String password, bool rememberMe) async {
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});

  final response = await helper.restPost(helper.API + "authenticate", body);

  helper.setStringPrefs(helper.TOKEN,json.decode(response)["id_token"]);

  return true;
}

/*
{
"sub": "admin",
"auth": "ROLE_ADMIN,ROLE_USER",
"exp": 1534324341
}
*/
