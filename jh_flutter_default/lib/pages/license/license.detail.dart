import 'package:flutter/material.dart';
import 'license.dart';
import 'license.form.dart';
import 'license.helper.dart';

class LicenseDetail extends StatelessWidget {
  final int id;
  License data;
  LicenseDetail({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("License Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: license(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? licenseDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LicenseFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget licenseDetail(License _data) {
    data = _data;
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[ 
              Text(data.id.toString()),
              Text(data.no.toString()),
              Text(data.area),
              ])
        ]);
  }
}
