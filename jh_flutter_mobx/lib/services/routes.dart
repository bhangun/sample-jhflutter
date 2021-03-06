import 'package:flutter/material.dart';
import '../view/account/user.list.dart';
import '../view/home.dart';
import '../view/login.dart';
import '../view/splash.dart';

// kutilang-needle-add-import-route - Don't remove, used by kutilang to add new import

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String userList = '/user';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    userList: (BuildContext context) => UserListPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home': return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login': return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/splash': return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/user': return MaterialPageRoute(builder: (_) => UserListPage());
      default: return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

/*
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
*/