import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jh_flutter_mobx/services/routes.dart';
import 'package:jh_flutter_mobx/services/sharedpref/constants/preferences.dart';
import 'package:jh_flutter_mobx/stores/authentication/authentication_store.dart';
import 'package:jh_flutter_mobx/stores/user/user_store.dart';
import 'package:jh_flutter_mobx/widgets/drawer.dart';
import 'package:jh_flutter_mobx/widgets/global_methods.dart';
import 'package:jh_flutter_mobx/widgets/progress_indicator_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final _store = AuthenticationStore();
  final _userStore = UserStore();

  @override
  void initState() {
    super.initState();

    //get all posts
     _userStore.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      drawer:  Observer(
          builder: (context) {
            return CommonDrawer(
        accountName: _userStore.userProfile.firstName, 
        accountEmail: _userStore.userProfile.email );
      })
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Posts'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return _store.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: Text('test'));
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _store.success
                ? Container()
                : showErrorMessage(context, _store.errorStore.errorMessage);
          },
        )
      ],
    );
  }


}