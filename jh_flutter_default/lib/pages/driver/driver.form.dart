import 'package:flutter/material.dart';
import '../../services/entity_services/driver.service.dart';
import '../../models/driver.dart'; 
import '../../models/license.dart';
import '../../services/entity_services/license.service.dart';
import '../../models/car.dart';
import '../../services/entity_services/car.service.dart';
import '../../models/owner.dart';
import '../../services/entity_services/owner.service.dart';

class DriverFormPage extends StatefulWidget {
  final Driver data;
  DriverFormPage({this.data});
  @override
  _DriverFormPageState createState() => _DriverFormPageState();
}

class _DriverFormPageState extends State<DriverFormPage> {
  bool isEdited = false;
  final _id = TextEditingController(); 
  final _name = TextEditingController();
  var _license; 
  var _car; 
  var _owner; 
  
  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      isEdited = true;
      Driver driver = widget.data;
       _id.text = driver.id.toString(); 
      _name.text = driver.name.toString();
      _license.text = driver.licenses.toString();
      _car.text = driver.cars.toString();
      _owner.text = driver.owners.toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Driver'),
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
        controller: _name,
        decoration: InputDecoration(
          filled: true,
          labelText: 'name',
        ),
        keyboardType: TextInputType.number,
      ), 
      FutureBuilder(
            future: licenses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData ? 
              DropdownButton<String>(
                value: _license,
                onChanged: (String newValue) {
                  setState(() {
                    _license = newValue;
                  });
                },
                items: snapshot.data.map<DropdownMenuItem<License>>((License license) {
                    return DropdownMenuItem<int>(
                      value: license.id,
                      child: Text('License'),
                    );
              }).toList(),
            ): Center(child: CircularProgressIndicator());
      }), 
      
      FutureBuilder(
            future: cars(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData ? 
              DropdownButton<String>(
                value: _car,
                onChanged: (String newValue) {
                  setState(() {
                    _car = newValue;
                  });
                },
                items: snapshot.data.map<DropdownMenuItem<Car>>((Car car) {
                    return DropdownMenuItem<int>(
                      value: car.id,
                      child: Text('Car'),
                    );
              }).toList(),
            ): Center(child: CircularProgressIndicator());
      }), 
      
      FutureBuilder(
            future: owners(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData ? 
              DropdownButton<String>(
                value: _owner,
                onChanged: (String newValue) {
                  setState(() {
                    _owner = newValue;
                  });
                },
                items: snapshot.data.map<DropdownMenuItem<Owner>>((Owner owner) {
                    return DropdownMenuItem<int>(
                      value: owner.id,
                      child: Text('Owner'),
                    );
              }).toList(),
            ): Center(child: CircularProgressIndicator());
      }), 
      
    ];
  }

  void _save() async {
    try {
      if (isEdited) {
        await updateDriver(Driver(
          id: int.parse(_id.text), 
          name: _name.text,
          licenses: _license, 
          cars: _car, 
          owners: _owner, 
        ));
        isEdited =false;  
      } else {
        await createDriver(Driver(
          id: int.parse(_id.text),
          name: _name.text,
          licenses: _license, 
          cars: _car, 
          owners: _owner, 
        ));
      }
    } catch (e) {
      print(e.toString());
    }
    Navigator.pop(context);
  }
}