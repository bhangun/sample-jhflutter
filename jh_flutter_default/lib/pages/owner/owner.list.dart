import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/owner.dart';
import 'owner.detail.dart';
import '../../services/entity_services/owner.service.dart';
import 'owner.form.dart';

class OwnerListPage extends StatefulWidget {

  @override
  _OwnerListPageState createState() => _OwnerListPageState();
}

final String _title = "Owner List";

class _OwnerListPageState extends State<OwnerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: owners(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? OwnerList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OwnerFormPage()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}
 

Widget item(int id, String name, 
BuildContext context) {
  return ListTile(
      title: Text(name,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OwnerDetail(id: id )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class OwnerList extends StatelessWidget {
  final String data;
  OwnerList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<Owner> _items =
        parsed.map<Owner>((json) => Owner.fromJson(json)).toList();
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final owner = _items[index];
        return item( 
        owner.id,  
        owner.name, 
           context);
      },
    );
  }
}
