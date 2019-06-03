import 'package:flutter/material.dart';
import '../../models/driver.dart';
import 'driver.form.dart';
import '../../services/entity_services/driver.service.dart';

class DriverDetail extends StatelessWidget {
  final int id;
  Driver data;
  DriverDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Driver Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: driver(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? driverDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DriverFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget driverDetail(Driver _data) {
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
