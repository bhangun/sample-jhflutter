import 'package:meta/meta.dart';

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}


class LoginButtonPressed extends AuthenticationEvent {
  final String username;
  final String password;
  final bool rememberMe;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
    this.rememberMe
  });
}

class LoggedIn extends AuthenticationEvent {
   final String token;

  LoggedIn({@required this.token}); 
}

class LoggedOut extends AuthenticationEvent {}