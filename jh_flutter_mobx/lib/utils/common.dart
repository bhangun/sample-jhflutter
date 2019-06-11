import 'dart:async';
import 'dart:convert';

import 'package:jh_flutter_mobx/models/user.dart';
import 'package:jh_flutter_mobx/services/connection.dart';
import 'package:jh_flutter_mobx/services/user.helper.dart';
import 'package:jh_flutter_mobx/utils/config.dart';
import 'package:jh_flutter_mobx/utils/helper.dart';


Future<bool> login(String username, String password, bool rememberMe) async {
  logout();
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});
  try {
    final response = await restPost("authenticate", body);
    setPrefs(TOKEN, json.decode(response)["id_token"]);

    String profile = await restGet(API_ACCOUNT,true,false);
    setPrefs(PROFILE, profile);

    return true;
  } catch (e) {
    return false;
  }
}

logout(){
  setPrefs(TOKEN, "");
  setPrefs(PROFILE, "");
}

Future<User> userProfile() async {
 String profile = await prefs(PROFILE);
  return User.fromJson(json.decode(profile));
}


