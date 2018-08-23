import 'package:flutter/material.dart';
import 'widgets.dart';// deferred as listMenuDrawer;


class CommonDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listMenu(context),
      ),
    );
  }

  CommonDrawer({
    this.accountName,
    this.accountEmail
  });


  Widget _header(String imgPath) =>
      UserAccountsDrawerHeader(
        accountName: Text(
          accountName,
        ),
        accountEmail: Text(
          accountEmail,
        ),
        currentAccountPicture: CircleAvatar(
          // backgroundImage: ,
        ),
      );

  Widget _listTitle(String name,BuildContext context) =>
      ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        onTap: ()=> Navigator.pushNamed(context, "/users"),
      );

  _listMenu(BuildContext context){
    var list = <Widget>[];
    list.add(_header(""));
    list.add(_listTitle("Register", context));
    list.add(_listTitle("User", context));
    return list;
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