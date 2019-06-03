import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/wheel.dart';
import 'wheel.detail.dart';
import '../../services/entity_services/wheel.service.dart';
import 'wheel.form.dart';

class WheelListPage extends StatefulWidget {

  @override
  _WheelListPageState createState() => _WheelListPageState();
}

final String _title = "Wheel List";

class _WheelListPageState extends State<WheelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: wheels(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? WheelList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WheelFormPage()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}
  

Widget item(int id, String position, String brand, 
BuildContext context) {
  return ListTile(
      title: Text(position,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(brand),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WheelDetail(id: id )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class WheelList extends StatelessWidget {
  final String data;
  WheelList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<Wheel> _items =
        parsed.map<Wheel>((json) => Wheel.fromJson(json)).toList();
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final wheel = _items[index];
        return item( 
        wheel.id,  
        wheel.position,  
        wheel.brand, 
           context);
      },
    );
  }
}
