import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_bus/event_bus.dart';


final String base_url = 'http://localhost:8080/';

final String path = base_url+'api/';

EventBus eventBus = new EventBus();

Map<String,String> header = {"Content-Type": "application/json"};

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

savePrefs(String key,String value) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  await prefs.setString(key, value);
}


getPrefs(String key) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  await prefs.getString(key);
}

String API_ACCOUNT= path+'account';

// POST saveAccount
var API_ACCOUNT_SAVE= path+"account";

// POST changePassword
var API_ACCOUNT_CHANGE_PASSWORD= path+"account/change-password";

//POST finishPasswordReset
var API_ACCOUNT_RESET_FINISH= path+"account/reset-password/finish";

// POST requestPasswordReset
var API_ACCOUNT_RESET_INIT= path+"account/reset-password/init";

// GET activateAccount
var API_ACTIVATE= path+"activate";

// POST registerAccount
var API_REGISTER = path+"register";

// GET getActiveProfiles
var API_PROFILE_INFO = path+"profile-info";

// POST authorize
//GET isAuthenticated
var API_USERS_AUTHENTICATE = path+"authenticate";

// GET getAllUsers
// POST createUser
// PUT updateUser
// DELETE deleteUser
var API_USERS = path+"users";

// GET getAuthorities
var API_USERS_AUTHORITIES = path+"users/authorities";

// GET getUser
// DELETE deleteUser
var API_USER= path+"users/";

