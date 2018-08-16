// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'login.dart';
//import 'widgets/login_anim.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Page',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: _routes
    );
  }


  final _routes = <String, WidgetBuilder> {
      "/home":(BuildContext context) => null,
      "/register": (BuildContext context) => null,//new SignIn(),
      "/users": (BuildContext context) => null,
      "/dashboard": (BuildContext context) => null,
      "/entities": (BuildContext context) => null,
      "/entity": (BuildContext context) => null
  };

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

