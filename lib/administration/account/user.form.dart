import 'package:flutter/material.dart';
import 'user.helper.dart';
import 'user.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create User'),
        ),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: _listChild())),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print(">>>>print>>>");
             createUser(User(
                login: _username.text,
                firstName: _firstname.text,
                lastName: _lastname.text,
                email: _email.text,
                imageUrl: "",
                activated: true,
                langKey: "en",
                authorities: ['"ROLE_USER"'],
                createdBy: "",
                createdDate: DateTime.now(),
                lastModifiedBy: "",
                lastModifiedDate: DateTime.now()
            ).toJson().toString());
          },
          tooltip: 'Add',
          child: Icon(Icons.save),
        ));
  }

  bool _activated =false;
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();

  _listChild() {
    return <Widget>[
      SizedBox(height: 120.0),
      TextField(
        controller: _username,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Login',
        ),
      ),
      TextField(
        controller: _firstname,
        decoration: InputDecoration(
          filled: true,
          labelText: 'First Name',
        ),
      ),
      TextField(
        controller: _lastname,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Last Name',
        ),
      ),
      TextField(
        controller: _email,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Email',
        ),
      ),
      Checkbox(
        value: false,
        onChanged: (b)=>_activated=b,
      ),
      RaisedButton(
        child: Text('Profile'),
        onPressed: () {}
      ),
      ButtonBar(children: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: ()=> _clearForm
        ),
        FlatButton(
          child: Text('SAVE'),
          onPressed: ()=> _save
        ),
      ])
    ];
  }

  void _save() async {
    print(">>>>print>>>");
    await createUser(User(
      login: _username.toString(),
        firstName: _firstname.toString(),
    lastName: _lastname.toString(),
    email: _email.toString(),
    imageUrl: "",
    activated: false,
    langKey: "",
    authorities: null,
    createdBy: "",
    createdDate: null,
    lastModifiedBy: "",
    lastModifiedDate: null
    ).toJson().toString());
  }

  void _clearForm(){
    _username.clear();
    _password.clear();
     _firstname.clear();
     _lastname.clear();
     _email.clear();
  }
}
