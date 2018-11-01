import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'package:jh_flutter_sample/services/services.dart';



class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

@override
  AuthenticationState get initialState => AuthenticationState.initializing();

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLogin({@required String token}) {
    dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    dispatch(LoggedOut());
  }

  void onLoginButtonPressed({String username, String password, bool rememberMe}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
        rememberMe: rememberMe
      ),
    );
  }

  /* void onLoginSuccess() {
    dispatch(LoggedIn());
  } */

  
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state, AuthenticationEvent event) async* {
    
    if (event is AppStarted) {
      print("------AppStarted--------");
      final bool hasToken = await _hasToken();

      if (hasToken) {
        yield AuthenticationState.authenticated();
      } else {
        yield AuthenticationState.unauthenticated();
      }
    }

    if (event is LoggedIn) {
      print("------LoggedIn--------");
      yield state.copyWith(isLoading: true);

      await _persistToken(event.token);
      yield AuthenticationState.authenticated();
    }

    if (event is LoggedOut) {
      print("------LoggedOut--------");
      yield state.copyWith(isLoading: true);

      await _deleteToken();
      yield AuthenticationState.unauthenticated();
    }

    if (event is LoginButtonPressed) {
      yield AuthenticationState.loading();

      try {
        final token = await _getToken(
          username: event.username,
          password: event.password,
          rememberMe: event.rememberMe
        );

        yield AuthenticationState.success(token);
      } catch (error) {
        yield AuthenticationState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationState.initial();
    }
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

  Future<String> _getToken({
    @required String username,
    @required String password,
    bool rememberMe
  }) async {
    //await Future.delayed(Duration(seconds: 1));
    var token =await loginToken(username, password,false);
    /// uncomment the following line to simulator a login error.
  // throw Exception('Login Error');
    return token;
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
} 
}