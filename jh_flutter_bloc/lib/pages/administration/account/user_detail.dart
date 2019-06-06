import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/blocs/user_bloc/user.dart';
import '../../../models/user.dart';

class UserDetail extends StatelessWidget{
  final int id;
  final String username;
  final _title ='User Detail';
   UserBloc _userBloc = null;
  UserDetail({@required this.id, @required this.username});

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
   _userBloc.fetchUser(id);
    return BlocBuilder<UserEvent, UserState> (
      bloc: _userBloc,
      builder: (BuildContext context, UserState state) {
    
        return Scaffold(
                appBar: AppBar(
                  title: Text(_title),
                  elevation: 5.0, // Removing the drop shadow cast by the app bar.
                ),
                body: //state.isAuthenticated? userDetail(user):
                           Center(child: CircularProgressIndicator())
        );
      }
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