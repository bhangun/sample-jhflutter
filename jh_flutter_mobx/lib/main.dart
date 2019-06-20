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
import 'package:flutter/services.dart';
import 'package:jh_flutter_mobx/constants/strings.dart';
import 'package:jh_flutter_mobx/screens/splash.dart';
import 'package:jh_flutter_mobx/services/routes.dart';
import 'package:jh_flutter_mobx/themes/index.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: darkTheme,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}

/* 
void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  final _title = "My Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeScreen(),
      initialRoute: Route.,
      onGenerateRoute: route,
      routes: routes,
      theme: defaultTheme,
    );
  }
} */