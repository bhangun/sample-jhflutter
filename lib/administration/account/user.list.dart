import 'package:flutter/material.dart';
import 'user.helper.dart';
import 'user.dart';
import 'dart:convert';
/*import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert';
import 'dart:async';*/



/*class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<User>, List<User>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
        itemCount: list.length,
       // itemBuilder: (context, i) => ShoppingItem(item: list[i]),
      ),
    );
  }
}*/

class UserListPage extends StatefulWidget {
  //UserListPage({Key key, this.title}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

final String _title = "User List";

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: users(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? UserList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: _add,
          tooltip: 'Add',
          child: new Icon(Icons.add),
        ));
  }
}

void _add() {}

/*List<Widget> _users(String data, BuildContext context) {
  List<Widget> list = <Widget>[];
  for (var user in usersData(data))
    list.add(item(user.id, user.firstName, user.email, context));

  return list;
}*/

//

Widget item(int id, String name, String role, BuildContext context) {
  return ListTile(
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(role),
      onTap: _viewDetail(id, context),
      leading: Icon(Icons.theaters, color: Colors.blue[500]));
}

_viewDetail(int id, BuildContext context) {

  print(">>???>$id");
  //Navigator.pop(context);
  //Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
}

class UserList extends StatelessWidget{
  final String data;


  UserList({this.data});

  @override
  Widget build(BuildContext context) {
    //List<User> _items = new List<User>();

    /*for (var user in usersData(data))
    { _items.add(user);
    print(user.firstName);
    }*/
    final parsed =json.decode(data).cast<Map<String, dynamic>>();
    List<User> lu= parsed.map<User>((json) => User.fromJson(json)).toList();

    List<User> _items = lu;//usersData(data);

    // = usersData(data);
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: _items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = _items[index];

          return ListTile(
            title: Text(
              item.firstName,
            ),
          );
      },
    );
  }

}

/*class UserList extends StatelessWidget {
  final String data;

  var control = TrackingScrollController();

  UserList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _users(data, context),
    );
  }
}*/
