import 'package:flutter/material.dart';

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
      body: Center(
        child: ListView(
          children: list,
        ),
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

List<Widget> list = <Widget>[
  ListTile(
    title: Text('CineArts at the Empire',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('85 W Portal Ave'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500],
    ),
  ),
];
