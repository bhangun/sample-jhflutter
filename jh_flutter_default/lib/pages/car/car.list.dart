import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/car.dart';
import 'car.detail.dart';
import '../../services/entity_services/car.service.dart';
import 'car.form.dart';

class CarListPage extends StatefulWidget {

  @override
  _CarListPageState createState() => _CarListPageState();
}

final String _title = "Car List";

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: cars(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? CarList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CarFormPage()));
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
                builder: (context) => CarDetail(id: id )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class CarList extends StatelessWidget {
  final String data;
  CarList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<Car> _items =
        parsed.map<Car>((json) => Car.fromJson(json)).toList();
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final car = _items[index];
        return item( 
        car.id,  
        car.name, 
           context);
      },
    );
  }
}
