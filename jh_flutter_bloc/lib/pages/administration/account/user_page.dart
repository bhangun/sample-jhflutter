import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/blocs/user_bloc/user.dart';
import 'package:jh_flutter_sample/pages/administration/account/user_list.dart';

import 'user_detail.dart';
import 'user_form.dart';
import '../../../models/user.dart';


class UserPage extends StatefulWidget {
  //final String title;
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
  
}



class _UserPageState extends State<UserPage> {
  final String _title = "User Page";
  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
     _userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<UserEvent, UserState> (
      bloc: _userBloc,
      builder: (BuildContext context, UserState state) {

        if (state.error.isNotEmpty) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        if (state.pages == Pages.list) {
          return UserListPage();
        }

        
      });
  }

void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }
}