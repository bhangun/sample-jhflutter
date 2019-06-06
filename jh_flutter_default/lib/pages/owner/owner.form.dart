import 'package:flutter/material.dart';
import '../../services/entity_services/owner.service.dart';
import '../../models/owner.dart'; 

class OwnerFormPage extends StatefulWidget {
  final Owner data;
  OwnerFormPage({this.data});
  @override
  _OwnerFormPageState createState() => _OwnerFormPageState();
}

class _OwnerFormPageState extends State<OwnerFormPage> {
  bool isEdited = false;
  final _id = TextEditingController(); 
  final _name = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      isEdited = true;
      Owner owner = widget.data;
       _id.text = owner.id.toString(); 
      _name.text = owner.name.toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Owner'),
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
    ];
  }

  void _save() async {
    try {
      if (isEdited) {
        await updateOwner(Owner(
          id: int.parse(_id.text), 
          name: _name.text,
        ));
        isEdited =false;  
      } else {
        await createOwner(Owner(
          id: int.parse(_id.text),
          name: _name.text,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
    Navigator.pop(context);
  }
}