import 'package:flutter/material.dart';
import 'package:jh_flutter_sample/services/common.dart' as auth;
import '../widgets/logo_anim.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _token="";


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
                  child: Text('Cancel'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    try {
                      auth.login(
                          _usernameController.text, _passwordController.text,
                          false).then((bool v) {
                            print("<><><>"+v.toString());

                        if (v) {
                          _usernameController.clear();
                          _passwordController.clear();
                          Navigator.pop(context);

                        } else {
                          Navigator.of(context).pop();
                          print("diskonek");
                        }
                      });
                    }catch(e){
                      Navigator.of(context).pop();
                      print(">>>>>>>>>"+e.toString());
                    }
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



