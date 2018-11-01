import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:jh_flutter_sample/services/services.dart';
import 'login_event.dart';
import 'login_state.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState get initialState => LoginState.initial();

  void onLoginButtonPressed({String username, String password, bool rememberMe}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
        rememberMe: rememberMe
      ),
    );
  }

  void onLoginSuccess() {
    dispatch(LoggedIn());
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginState state,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginState.loading();

      try {
        final token = await _getToken(
          username: event.username,
          password: event.password,
          rememberMe: event.rememberMe
        );

        yield LoginState.success(token);
      } catch (error) {
        yield LoginState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      yield LoginState.initial();
    }
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