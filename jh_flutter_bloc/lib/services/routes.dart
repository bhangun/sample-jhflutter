import 'package:flutter/material.dart';
import 'package:jh_flutter_sample/pages/login.dart';
import '../pages/administration/dashboard.dart';
import '../pages/administration/account/user_form.dart';
import '../pages/administration/account/user_list.dart';
import '../pages/administration/account/user_page.dart';

final routes = <String, WidgetBuilder> {
  "/home":(BuildContext context) => null,
  "/register": (BuildContext context) => null,
  "/users": (BuildContext context) => UserPage(),
  "/usersForm": (BuildContext context) => UserFormPage(),
  "/dashboard": (BuildContext context) => Dashboard(),
  "/entities": (BuildContext context) => null,
  "/entity": (BuildContext context) => null,
  "/login": (BuildContext context) => LoginPage()
};