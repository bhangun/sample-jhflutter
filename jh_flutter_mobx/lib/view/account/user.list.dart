import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/user/user_store.dart';
import '../../widgets/global_methods.dart';
import '../../widgets/progress_indicator_widget.dart';
import 'user.form.dart';

class UserList extends StatefulWidget {
  final String title;
  UserList({Key key, this.title}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  final _userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: KutAppbar(key:Key("appbar"), title: 'User List', context:context),//_buildAppBar(context),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserFormPage()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        )
    );
  }

  /* Widget _buildAppBar(BuildContext context) {
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
  } */

   _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return _userStore.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: _buildListView());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _userStore.success
                ? Container()
                : showErrorMessage(context, _userStore.errorStore.errorMessage);
          },
        )
      ],
    );
  }

  _buildListView() {
    return _userStore.userList != null
        ? ListView.separated(
            itemCount: _userStore.userList.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return ListTile(
                leading: Icon(Icons.cloud_circle),
                title: Text(
                  '${_userStore.userList[position].email}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  '${_userStore.userList[position].lastName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              );
            },
          )
        : Center(child: Text('No posts found'));
  }

}


/* 
Widget item(int id, String name, String role, BuildContext context) {
  return ListTile(
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(role),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetail(
                      id: id,
                      username: name,
                    )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class UserList extends StatelessWidget {
  final String data;
  UserList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> _items =
        parsed.map<User>((json) => User.fromJson(json)).toList();

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final user = _items[index];
        return item(user.id, user.login, user.email, context);
      },
    );
  }
} */
