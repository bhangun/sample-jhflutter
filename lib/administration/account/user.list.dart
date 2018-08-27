import 'package:flutter/material.dart';
import 'user.detail.dart';
import 'user.helper.dart';
import 'user.dart';
import 'dart:convert';

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


Widget item(int id, String name, String role, BuildContext context) {
  return ListTile(
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(role),
      //onTap: _viewDetail(id, context),
      onLongPress: (){
        print(id.toString()+" > panjaaaang");
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(id: id,username: name,)));
      },
      leading: Icon(Icons.theaters, color: Colors.blue[500]));
}

class UserList extends StatelessWidget{
  final String data;


  UserList({this.data});

  @override
  Widget build(BuildContext context) {

    final parsed =json.decode(data).cast<Map<String, dynamic>>();
    List<User> _items= parsed.map<User>((json) => User.fromJson(json)).toList();


    // = usersData(data);
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: _items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final user = _items[index];
        return item(user.id, user.login, user.email, context);
      },
    );
  }

}