import 'package:flutter/material.dart';
import '../administration/dashboard.dart';
import '../administration/account/user.form.dart';
import '../administration/account/user.list.dart';
import '../pages/login.dart';
import '../pages/license/license.list.dart';
import '../pages/car/car.list.dart';
import '../pages/owner/owner.list.dart';
import '../pages/wheel/wheel.list.dart';
import '../pages/driver/driver.list.dart';
// kutilang-needle-add-import-route - Don't remove, used by kutilang to add new import

Route<dynamic> route(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final loginRoute = "/login";

final routes = <String, WidgetBuilder> {
  "/home":(BuildContext context) => null,
  "/register": (BuildContext context) => null,//new SignIn(),
  "/users": (BuildContext context) => UserListPage(),
  "/usersForm": (BuildContext context) => UserFormPage(),
  "/dashboard": (BuildContext context) => Dashboard(),
  "/license": (BuildContext context) => LicenseListPage(),
  "/car": (BuildContext context) => CarListPage(),
  "/owner": (BuildContext context) => OwnerListPage(),
  "/wheel": (BuildContext context) => WheelListPage(),
  "/driver": (BuildContext context) => DriverListPage(),
  // kutilang-needle-add-route - Don't remove, used by kutilang to add new route
};