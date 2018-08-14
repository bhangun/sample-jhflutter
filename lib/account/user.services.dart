import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jh_flutter_sample/account/user.dart';
import 'package:meta/meta.dart';
import '../services/helper.dart' as helper;


String API_ACCOUNT= 'account';

// POST saveAccount
const API_ACCOUNT_SAVE= "account";

// POST changePassword
const API_ACCOUNT_CHANGE_PASSWORD= "account/change-password";

//POST finishPasswordReset
const API_ACCOUNT_RESET_FINISH= "account/reset-password/finish";

// POST requestPasswordReset
const API_ACCOUNT_RESET_INIT= "account/reset-password/init";

// GET activateAccount
const API_ACTIVATE= "activate";

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
// DELETE deleteUser
const API_USERS = "users";

// GET getUser
// DELETE deleteUser
const API_USER= "users/";


  Future<User> getUser(String user) async {
    return User.fromJson(json.decode(await helper.restGet(API_USER + user)));
  }


  Future<List<User>> getUsers() async {
    return (json.decode(await helper.restGet(API_USERS)) as List).map((v) => User.fromJson(v)).toList();
  }

/*
  createUsers(List<User> User){
    helper.restPost(helper.API+"authenticate", body);

  }

  updateUsers(users: User){
  base.api.put(API_USERS,users)
  }

  deleteUser(login: String){
  base.api.put(API_USER+"$login")
  }


*/

