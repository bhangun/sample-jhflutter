import 'package:flutter/material.dart';
import 'license.detail.dart';
import 'license.helper.dart';
import 'license.dart';
import 'dart:convert';
import 'license.form.dart';

class LicenseListPage extends StatefulWidget {

  @override
  _LicenseListPageState createState() => _LicenseListPageState();
}

final String _title = "License List";

class _LicenseListPageState extends State<LicenseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: licenses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? LicenseList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LicenseFormPage()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}
  

Widget item(int id, int no, Area area, 
BuildContext context) {
  return ListTile(
      title: Text(no.toString(),
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(area),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LicenseDetail(id: id )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class LicenseList extends StatelessWidget {
  final String data;
  LicenseList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<License> _items =
        parsed.map<License>((json) => License.fromJson(json)).toList();
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final license = _items[index];
        return item( 
        license.id,  
        license.no,  
        license.area, 
           context);
      },
    );
  }
}
