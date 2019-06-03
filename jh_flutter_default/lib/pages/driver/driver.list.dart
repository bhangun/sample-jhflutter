import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/driver.dart';
import 'driver.detail.dart';
import '../../services/entity_services/driver.service.dart';
import 'driver.form.dart';

class DriverListPage extends StatefulWidget {

  @override
  _DriverListPageState createState() => _DriverListPageState();
}

final String _title = "Driver List";

class _DriverListPageState extends State<DriverListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: drivers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? DriverList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DriverFormPage()));
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
                builder: (context) => DriverDetail(id: id )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class DriverList extends StatelessWidget {
  final String data;
  DriverList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<Driver> _items =
        parsed.map<Driver>((json) => Driver.fromJson(json)).toList();
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final driver = _items[index];
        return item( 
        driver.id,  
        driver.name, 
           context);
      },
    );
  }
}
