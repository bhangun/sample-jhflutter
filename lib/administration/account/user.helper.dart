import 'dart:async';
import 'dart:convert';
import 'package:jh_flutter_sample/administration/account/user.dart';
import '../../services/connection.dart';

String API_ACCOUNT = 'account';

// POST saveAccount
const API_ACCOUNT_SAVE = "account";

// POST changePassword
const API_ACCOUNT_CHANGE_PASSWORD = "account/change-password";

//POST finishPasswordReset
const API_ACCOUNT_RESET_FINISH = "account/reset-password/finish";

// POST requestPasswordReset
const API_ACCOUNT_RESET_INIT = "account/reset-password/init";

// GET activateAccount
const API_ACTIVATE = "activate";

// POST registerAccount
const API_REGISTER = "register";

// GET getActiveProfiles
const API_PROFILE_INFO = "profile-info";

// POST authorize
//GET isAuthenticated
const API_USERS_AUTHENTICATE = "authenticate";

// GET getAuthorities
const API_USERS_AUTHORITIES = "users/authorities";

// GET getAllUsers
// POST createUser
// PUT updateUser
const API_USERS = "users";

// GET getUser
// DELETE deleteUser
const API_USER = "users/";

//
Future<User> user(String user) async {
  var response = await restGet(API_USER + user);
  return User.fromJson(json.decode(response));
}

//
Future<List<User>> users() async {
  var response =await restGet(API_USERS);

  final parsed =json.decode(response).cast<Map<String, dynamic>>();
  print((parsed.map<User>((json) => User.fromJson(json)).toList()).toString());
  print("<><><><><><>< "+response);


  /*return (json.decode(response) as List)
      .map((v) => User.fromJson(v))
      .toList();*/

  return (json.decode(response) as List);
}


//
createUser(User user) async {
  return await restPost(API_USERS, user.toJson().toString());
}

//
updateUsers(User user) async {
  return await restPut(API_USERS, user.toJson().toString());
}

//
deleteUser(User user) async {
  return await restDelete(API_USER + user.toJson().toString());
}
