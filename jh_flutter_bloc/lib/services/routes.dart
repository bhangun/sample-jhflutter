import 'package:flutter/material.dart';
import '../pages/administration/dashboard.dart';
import '../pages/administration/account/user.form.dart';
import '../pages/administration/account/user.list.dart';


final routes = <String, WidgetBuilder> {
  "/home":(BuildContext context) => null,
  "/register": (BuildContext context) => null,//new SignIn(),
  "/users": (BuildContext context) => UserListPage(),
  "/usersForm": (BuildContext context) => UserFormPage(),
  "/dashboard": (BuildContext context) => Dashboard(),
  "/entities": (BuildContext context) => null,
  "/entity": (BuildContext context) => null
};