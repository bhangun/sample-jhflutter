import 'package:flutter/material.dart';
import '../../models/car.dart';
import 'car.form.dart';
import '../../services/entity_services/car.service.dart';

class CarDetail extends StatelessWidget {
  final int id;
  Car data;
  CarDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Car Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: car(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? carDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CarFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget carDetail(Car _data) {
    data = _data;
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[ 
              Text(data.id.toString()),
              Text(data.name),
              ])
        ]);
  }
}
