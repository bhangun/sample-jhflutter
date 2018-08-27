import 'package:flutter/material.dart';
import '../administration/account/user.form.dart';
import '../administration/account/user.list.dart';
import 'package:jh_flutter_sample/pages/login.dart';
//import 'widgets/login_anim.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final login = "/login";

final routes = <String, WidgetBuilder> {
  "/home":(BuildContext context) => null,
  "/register": (BuildContext context) => null,//new SignIn(),
  "/users": (BuildContext context) => UserListPage(),
  "/usersForm": (BuildContext context) => UserFormPage(),
  "/dashboard": (BuildContext context) => null,
  "/entities": (BuildContext context) => null,
  "/entity": (BuildContext context) => null
};