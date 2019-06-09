import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jh_flutter_mobx/services/routes.dart';
import 'package:jh_flutter_mobx/services/sharedpref/constants/preferences.dart';
import 'package:jh_flutter_mobx/widgets/app_icon_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: AppIconWidget(image: 'assets/icons/ic_appicon.png')),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
