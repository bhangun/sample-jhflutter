import 'dart:async';
import 'dart:convert';
import '../pages/administration/dashboard.dart';

import '../services/api.dart';
import '../services/helper.dart';
import '../services/config.dart';

/* Future<bool> login(String username, String password, bool rememberMe) async {
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});
try {
  final response = await restPost("authenticate", body);
  setPrefs(TOKEN,json.decode(response)["id_token"]);
  return true;
}catch(e){
  return false;
}
}

Future<String> loginToken(String username, String password, bool rememberMe) async {
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});
try {
  final response = await restPost("authenticate", body);
  return json.decode(response)["id_token"];
  
}catch(e){
  return e.toString();
}
} */

Future<Health> health() async {
  var response = await restGet("management/metrics",true,true);
print(json.decode(response)["gauges"]+"---"+response);
  var parsed =json.decode(response).cast<Map<String, dynamic>>();
  Health health= parsed.map<Health>((json) => Health.fromJson(json));//.toList();
print(health.gauges.jvmGarbageMarkSweepCount);
  return Health.fromJson(json.decode(response));
}