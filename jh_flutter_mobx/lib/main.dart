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
import 'package:jh_flutter_mobx/screens/home.dart';
import 'package:jh_flutter_mobx/themes/default_theme.dart';
import 'services/services.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  final _title = "My Page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeScreen(),
      initialRoute: loginRoute,
      onGenerateRoute: route,
      routes: routes,
      theme: defaultTheme,
    );
  }
}