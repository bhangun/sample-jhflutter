

import 'package:flutter/material.dart';
import 'license.helper.dart';
import 'license.dart';
import '../../services/services.dart';

class LicenseFormPage extends StatefulWidget {
  final License data;
  LicenseFormPage({this.data});
  @override
  _LicenseFormPageState createState() => _LicenseFormPageState();
}

class _LicenseFormPageState extends State<LicenseFormPage> {
  bool isEdited = false;
  final _id = TextEditingController(); 
  final _no = TextEditingController();
  var _area = '';
  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      isEdited = true;
      License license = widget.data;
      _id.text = license.id.toString();
      _no.text = license.no.toString();
      _area = license.area;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create License'),
        ),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: _listChild())),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          tooltip: 'Add',
          child: Icon(Icons.save),
        ));
  }

  _listChild() {
    return <Widget>[
      SizedBox(height: 120.0),
      TextField(
        controller: _id,
        decoration: InputDecoration(
          filled: true,
          labelText: 'ID',
        ),
        enabled: false
      ), 
      TextField(
        controller: _no,
        decoration: InputDecoration(
          filled: true,
          labelText: 'No',
        ),
        keyboardType: TextInputType.number,
      ), 

      DropdownButton<String>(
        value: _area,
        onChanged: (String newValue) {
          setState(() {
            _area = newValue;
          });
        },
        items: area.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList(),
      ),
    ];
  }

  void _save() async {
    try {
      if (isEdited) {
        await updateLicense(License(
          id: int.parse(_id.text),
          no: int.parse(_no.text),
          area: _area,
        ));
        isEdited =false;  
      } else {
        await createLicense(License(
          no: int.parse(_no.text),
          area: _area,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
    Navigator.pop(context);
  }

  void _clearForm() {
    _no.clear();
  }
}
