import 'package:flutter/material.dart';
import 'widgets.dart';// deferred as listMenuDrawer;


class CommonDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;

  CommonDrawer({
    this.accountName,
    this.accountEmail
  });


  Widget _listTitle(String name) =>
      ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
      );

  Widget _header(String imgPath) =>
      UserAccountsDrawerHeader(
        accountName: Text(
          accountName,
        ),
        accountEmail: Text(
          accountEmail,
        ),
        currentAccountPicture: CircleAvatar(
          // backgroundImage: new AssetImage(imgPath),
        ),
      );

  _listMenu(){
    var list = <Widget>[];
    list.add(_header(""));
    list.add(_listTitle("shoping"));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listMenu(),
      ),
    );
  }
}


/*
<Widget>[

        //  MyAboutTile()
        ]

UserAccountsDrawerHeader(
            accountName: Text(
              accountName,
            ),
            accountEmail: Text(
              accountEmail,
            ),
            currentAccountPicture: CircleAvatar(
             // backgroundImage: new AssetImage(UIData.pkImage),
            ),
          ),
           ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          Divider(),
           ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
 */