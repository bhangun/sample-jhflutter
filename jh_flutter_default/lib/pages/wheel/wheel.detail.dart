import 'package:flutter/material.dart';
import '../../models/wheel.dart';
import 'wheel.form.dart';
import '../../services/entity_services/wheel.service.dart';

class WheelDetail extends StatelessWidget {
  final int id;
  Wheel data;
  WheelDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wheel Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: wheel(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? wheelDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WheelFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget wheelDetail(Wheel _data) {
    data = _data;
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[ 
              Text(data.id.toString()),
              Text(data.position),
              Text(data.brand),
              ])
        ]);
  }
}
