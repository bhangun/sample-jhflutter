import 'dart:async';
import 'dart:convert';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'user_event.dart';
import 'user_state.dart';
import '../../models/user.dart';
import '../../services/services.dart';



class UserBloc extends Bloc<UserEvent, UserState> {

  String token;

  @override
  UserState get initialState {
    return UserState.initializing();
  }

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLoggedIn({@required String token}) {
    dispatch(AuthorizeUser(token: token));
  }

  void onLogout() {
    dispatch(DeauthorizeUser());
  }

  void fetchUser(var id){
    dispatch(FetchUser(id: id));
  }

void createUser(User user) async {
  dispatch(SaveUser(user: user));
}
 
  
  @override
  Stream<UserState> mapEventToState(
      UserState state, UserEvent event) async* {
    
    if (event is AppStarted) {
      final bool hasToken = await _hasToken();
     // User user =await prefs(TOKEN);

     // fetchUser(token);
     if (hasToken) {
        //yield UserState.authorizedUser();
      } else {
       // yield UserState.unauthenticated();
      } 
    }

    if (event is AuthorizeUser) {

      yield state.copyWith(isLoading: true);

      await _fetchProfile(event.token);
    }
      
    if (event is DeauthorizeUser) {
            yield state.copyWith(isLoading: true);
      
            await _deleteToken();
    }

    if (event is FetchUser){
      String token = await prefs(TOKEN);
      var response = await restGet(API_USER + event.id.toString(),token);
      User user =User.fromJson(json.decode(response));
      yield state.copyWith(user: user);
    }


    if(event is SaveUser){

      var response = await restPost(API_USERS, event.user.toJson().toString(),token);
    }
  }
      



//
Future<User> user(String id) async {
  var response = await restGet(API_USER + id,token);
  return User.fromJson(json.decode(response));
}


//
Future<String> users(String token) async {
  return await restGet(API_USERS,token);
}

//


//
updateUsers(User user,String token) async {
  return await restPut(API_USERS, user.toJson().toString(),token);
}

//
deleteUser(User user,String token) async {
  return await restDelete(API_USER + user.toJson().toString(),token);
}


List<User> usersData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<User> lu= parsed.map<User>((json) => User.fromJson(json)).toList();
  return lu;
}




        Future<void> _deleteToken() async {
         removePrefs(TOKEN);
        }
      
        Future<void> _persistToken(String token) async {
          setPrefs(TOKEN,token);
        }
      
        Future<bool> _hasToken() async {
          bool _isTrue=false;
          prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
          return _isTrue;
          
        }
      
        _fetchProfile(String token) async{
          JWT jj = await jwt();
          print(jj.getClaim("auth"));
        }

        
        
}


const String API_ACCOUNT = 'account';
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