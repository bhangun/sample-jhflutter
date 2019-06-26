import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/authentication/authentication_store.dart';
import '../stores/user/user_store.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/global_methods.dart';
import '../widgets/progress_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final AuthenticationStore __authStore = AuthenticationStore();
  final UserStore _userStore = UserStore();
  //final _homeStore = HomeStore();

  @override
  void initState() {
    super.initState();

    //get profile
     _userStore.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,'Home'),
      body: _buildBody(),
      drawer:  Observer(
          builder: (context) {
            return CommonDrawer(
        accountName: _userStore.userProfile.firstName, 
        accountEmail: _userStore.userProfile.email );
      })
    );
  }

   _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return __authStore.loggedIn
                ? CustomProgressIndicatorWidget()
                : Material(child: Text('test'));
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return __authStore.success
                ? Container()
                : showErrorMessage(context, __authStore.errorStore.errorMessage);
          },
        )
      ],
    );
  }


}