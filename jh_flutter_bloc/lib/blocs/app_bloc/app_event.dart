import 'package:meta/meta.dart';

abstract class ApplicationEvent {}

class AppStarted extends ApplicationEvent {}

class FetchProfile extends ApplicationEvent {
  final String token;

  FetchProfile({@required this.token});
}

class LoggedOut extends ApplicationEvent {}