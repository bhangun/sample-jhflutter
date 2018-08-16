import 'package:flutter/material.dart';
import 'package:jh_flutter_sample/services/authentication.dart' as auth;
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/staggered.dart';
import 'widgets/logo_anim.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                //SvgPicture.asset('assets/logo-jhipster.svg'),
                SizedBox(height: 16.0),
                Text('Flutter'),
                LogoApp()
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    print(DateTime.parse("2018-08-16T04:51:46.706Z"));
                    print(DateTime.parse("2002-02-27T19:00:00Z").toIso8601String());
                    print(DateTime.now().toLocal());
                    print(DateTime.tryParse("2018-08-16T04:51:46.706Z").timeZoneName);
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    auth.login(_usernameController.text, _passwordController.text, false).then((bool v){
                      _usernameController.clear();
                      _passwordController.clear();



                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



