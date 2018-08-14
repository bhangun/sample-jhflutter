import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';


const BASE_URL = 'http://localhost:8080/';

const ADMIN = "ROLE_ADMIN";

const USER = "ROLE_USER";

const TOKEN = "token";

const API = BASE_URL+'api/';

//
restGet(String path) async {
  final response =  await http.get(path,
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer "+ await getStringPrefs("token")});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return response.body;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load get');
  }
}

//
restPost(String path,String payload,[bool auth=false]) async{
  final response =  await http.post(path,
      headers: {HttpHeaders.contentTypeHeader: "application/json",
      "Authorization":"Bearer  ${(auth)? await getStringPrefs("token"):""}"},
      body:payload,encoding: Encoding.getByName('UTF8') );
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return response.body;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load get');
  }
}

//
setStringPrefs(String key,String value) {
  SharedPreferences.getInstance().then((p)=>p.setString(key, value));
}

//
Future<String> getStringPrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}

Future<JWT> jwt() async {
  return JWT.parse(await getStringPrefs(TOKEN));
}

//
Future<List<String>> getRoles() async {
  return (await jwt()).getClaim("auth").toString().split(",");
}

Future<bool> isRole(String role) async {
  final List<String> b=await getRoles();
  return b.contains(role);
}