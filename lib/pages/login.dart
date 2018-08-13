
import 'package:flutter/material.dart';
import '../services/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

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
                  child: Text('NEXT'),
                  onPressed: () {
                    //UserController.fetchUser();
                    print(_usernameController.text +'--'+_passwordController.text);
                    UserController.login(_usernameController.text, _passwordController.text, false).then((bool v){
                      print("<<<<<<< $v");
                      _usernameController.clear();
                      _passwordController.clear();

                      UserController.fetchUsers().then((List<User> user){
                        print("<<<<<"+user[0].authorities[1]);
                      });
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



