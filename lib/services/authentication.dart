import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/login_vm.dart';
import '../model/user.dart';
import 'package:jh_flutter_sample/base.dart' as base;
import 'package:shared_preferences/shared_preferences.dart';

class UserController {

  static String token = '';


  /*
  fun createUsers(users: User){
  base.api.post(API_USERS,users)
  }

  fun getAllUsers(): ObservableList<User> {
  return  base.api.get(API_USERS).list().toModel()
  }

  fun getUsers(user : User): ObservableList<User> {
  return  base.api.get(API_USERS, user).list().toModel()
  }

  fun updateUsers(users: User){
  base.api.put(API_USERS,users)
  }

  fun deleteUser(login: String){
  base.api.put(API_USER+"$login")
  }
  */

  static Future<String> getPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token =prefs.getString("token");
    print('>>>3>>>'+token);
    return token;
  }

  static _pref() async{
    print('>>>1>>>');
    SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
    print('>>>2>>>');
    return prefs;
  }

  static Future<bool> login(String username, String password,
      bool rememberMe) async {

    var body = jsonEncode({"username":username,"password":password,"rememberMe":rememberMe});


    final response = await http.post(base.API_USERS_AUTHENTICATE,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body:body,encoding: Encoding.getByName('UTF8') );

    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print('>>>>>>>>???>>>>> '+response.body);
      //var token;
       token = json.decode(response.body)["id_token"];
      //SharedPreferences prefs = await base.prefs;
      //_pref().setString("token", token);
     // base.savePrefs("token", token);
      //await base.prefs.setString("token", token);
      print('>>>>>>>>#######>>>>> '+token);
      _pref();
      getPref();

      return true;
    } else {
      print('>>>>>>>>??>>>?>>>>> '+response.toString());
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<User> fetchUser() async {

    final response = await http.get(base.API_USER+"admin",
        headers: {HttpHeaders.contentTypeHeader: "application/json","Authorization" : "Bearer "+token});

    //final response = await http.ge.get('http://localhost:8080/api/users');
    print('>>>>///>>>>'+response.body);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print('>>>>>>>>'+response.body);

      return User.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}