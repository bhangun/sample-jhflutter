import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:jh_flutter_sample/services/common.dart' as auth;
import 'package:jh_flutter_sample/bloc/login_event.dart';
import 'package:jh_flutter_sample/bloc/login_state.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState get initialState => LoginState.initial();

  void onLoginButtonPressed({String username, String password}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
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
  }) async {
    //await Future.delayed(Duration(seconds: 1));
    var token =await auth.loginToken(
                          username, password,
                          false);
        print(token);                  
 return token;
    /// uncomment the following line to simulator a login error.
    // throw Exception('Login Error');
    
  }
}