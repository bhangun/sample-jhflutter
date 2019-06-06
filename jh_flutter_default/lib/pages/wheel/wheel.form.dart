import 'package:flutter/material.dart';
import '../../services/entity_services/wheel.service.dart';
import '../../models/wheel.dart'; 
import '../../models/car.dart';
import '../../services/entity_services/car.service.dart';

class WheelFormPage extends StatefulWidget {
  final Wheel data;
  WheelFormPage({this.data});
  @override
  _WheelFormPageState createState() => _WheelFormPageState();
}

class _WheelFormPageState extends State<WheelFormPage> {
  bool isEdited = false;
  final _id = TextEditingController(); 
  final _position = TextEditingController();
  final _brand = TextEditingController();
  var _car; 
  
  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      isEdited = true;
      Wheel wheel = widget.data;
       _id.text = wheel.id.toString(); 
      _position.text = wheel.position.toString();
      _brand.text = wheel.brand.toString();
      _car.text = wheel.cars.toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Wheel'),
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
        controller: _position,
        decoration: InputDecoration(
          filled: true,
          labelText: 'position',
        ),
        keyboardType: TextInputType.number,
      ), 
      TextField(
        controller: _brand,
        decoration: InputDecoration(
          filled: true,
          labelText: 'brand',
        ),
        keyboardType: TextInputType.number,
      ), 
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
      
    ];
  }

  void _save() async {
    try {
      if (isEdited) {
        await updateWheel(Wheel(
          id: int.parse(_id.text), 
          position: _position.text,
          brand: _brand.text,
          cars: _car, 
        ));
        isEdited =false;  
      } else {
        await createWheel(Wheel(
          id: int.parse(_id.text),
          position: _position.text,
          brand: _brand.text,
          cars: _car, 
        ));
      }
    } catch (e) {
      print(e.toString());
    }
    Navigator.pop(context);
  }
}