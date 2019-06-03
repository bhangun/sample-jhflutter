import 'package:flutter/material.dart';
import '../../models/owner.dart';
import 'owner.form.dart';
import '../../services/entity_services/owner.service.dart';

class OwnerDetail extends StatelessWidget {
  final int id;
  Owner data;
  OwnerDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Owner Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: owner(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? ownerDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OwnerFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget ownerDetail(Owner _data) {
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
