import 'package:flutter/material.dart';
import 'user.helper.dart';
import 'user.dart';
import 'dart:async';

class UserListPage extends StatefulWidget {
  //UserListPage({Key key, this.title}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

final String _title="User List";

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
             return
               snapshot.hasData
                   ? UserList(snapshot:snapshot)
                   : Center(child: CircularProgressIndicator());
            }
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _add,
          tooltip: 'Add',
          child: new Icon(Icons.add),
        ));
  }
}

void _add(){

}


List<Widget> _data(AsyncSnapshot snapshot) {
  List<Widget> list = <Widget>[];

  return snapshot.hasData
      ? _users(snapshot.data)
      : null ;
}

List<Widget> _users(List<User> users) {
  List<Widget> list = <Widget>[];
  for (var user in users)
    list.add(item(user.firstName,"user"));
  return list;

}

 /* if (snapshot.hasData) {
    print("+++++++1++++++"+snapshot.hasData.toString());
    //if (snapshot.data) {
print("++++++2+++++++"+snapshot.data.toString());

      List<User> luser = snapshot.data;
        for (var user in luser)
            list.add(item(user.firstName,"user"));

      return list;
    //}
  } else {
    list.add(item("bismillah", "tes"));
    return list;//new ProgressIndicator();
  }


  *//*users().then((List<User> lu){
    for (var user in lu)
      list.add(item(user.firstName,"user"));
  });
*/

//

Widget item(String name,String role){
  return ListTile(
      title: Text(name,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: Text(role),
  leading: Icon(
  Icons.theaters,
  color: Colors.blue[500]
  ));
}

class UserList extends StatelessWidget {
  final AsyncSnapshot snapshot;

  UserList({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _data(snapshot),
    );
  }
}