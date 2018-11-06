import 'package:meta/meta.dart';

abstract class ApplicationEvent {}

class AppStarted extends ApplicationEvent {}

class LoggedIn extends ApplicationEvent {
  final String token;

  LoggedIn({@required this.token});
}

class LoggedOut extends ApplicationEvent {}