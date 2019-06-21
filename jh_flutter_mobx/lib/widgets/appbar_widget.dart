import 'package:flutter/material.dart';
import 'package:jh_flutter_mobx/services/routes.dart';
import 'package:jh_flutter_mobx/stores/authentication/authentication_store.dart';

class KutAppbar extends StatefulWidget {
  final String title;
  final BuildContext context;
  KutAppbar({Key key,this.title, this.context}) : super(key: key);

  _kutAppbarState createState() => _kutAppbarState();
}

class _kutAppbarState extends State<KutAppbar> {
  final _authstore = AuthenticationStore();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          onPressed: () {
              _authstore.logout();
              Navigator.of(widget.context).pushReplacementNamed(Routes.login);
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }
}