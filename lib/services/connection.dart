import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'helper.dart';
import '../services/config.dart';

//
restGet(String path) async {
  final response =  await http.get(API+path,
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer "+ await prefs("token")});
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
  final response =  await http.post(API+path,
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer  ${(auth)? await prefs("token"):""}"},
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
restPut(String path,String payload,[bool auth=false]) async{
  final response =  await http.put(API+path,
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer  ${(auth)? await prefs("token"):""}"},
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
restDelete(String path) async {
  final response =  await http.delete(API+path,
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer "+ await prefs("token")});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return response.body;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load get');
  }
}