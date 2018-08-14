
import 'package:flutter/material.dart';
import 'services/authentication.dart' as auth;
import 'services/helper.dart' as helper;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String token;


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
                //Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SYIRKAH'),
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
            Checkbox(
                value: false,
                onChanged: null
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
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



