import 'package:flutter/material.dart';
import 'user.helper.dart';
import '../../../models/user.dart';

class UserDetail extends StatelessWidget{
  final int id;
  final String username;
  UserDetail({@required this.id, @required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: user(username),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? userDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            })
    );
  }

  Widget userDetail(User data) {

    return Column(
      children: <Widget>[
        Text(
            data.firstName
        ),
        Text(
            data.lastName
        ),
        Text(
            data.email
        ),
        Text(
            data.createdDate.toString()
        ),

      ],
    );
  }
}