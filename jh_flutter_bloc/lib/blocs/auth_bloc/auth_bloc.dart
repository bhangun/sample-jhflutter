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
  AuthenticationState get initialState { 
    print('----------AuthenticationState get initialState ');
    return AuthenticationState.initializing();
  }
  void checkAuthentication() {
    dispatch(CheckAuthentication());
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

  void onLogin({@required String token}) {
    dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    dispatch(LoggedOut());
  }

  
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state, AuthenticationEvent event) async* {
    
    if (event is CheckAuthentication) {
      print("----CheckAuthentication--AppStarted--------");
      final bool hasToken = await _hasToken();

      if (hasToken) {
        yield AuthenticationState.authenticated();
        print("------authenticated--------");
      } else {
        yield AuthenticationState.unauthenticated();
        print("------authenticated--------");
      }
    }

    if (event is LoginButtonPressed) {
      yield AuthenticationState.loading();

      try {
        final token = await _login(
          event.username, event.password, event.rememberMe);

        yield AuthenticationState.success(token);

      } catch (error) {
        yield AuthenticationState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      print("------LoggedIn--------");
      yield state.copyWith(isLoading: true);

      await _persistToken(event.token);
      yield AuthenticationState.authenticated();
    }

    if (event is LoggedOut) {
      print("------LoggedOut----2----");
      yield state.copyWith(isLoading: true);

      await _deleteToken();
      yield AuthenticationState.unauthenticated();
    }

    
    /* if (event is LoggedIn) {
      yield AuthenticationState.initial();
    } */
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

  Future<String> _login(String username, String password, bool rememberMe) async {
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