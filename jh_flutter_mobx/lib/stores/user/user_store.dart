
import 'dart:convert';

import 'package:jh_flutter_mobx/models/account/user.dart';
import 'package:jh_flutter_mobx/services/connection.dart';
import 'package:jh_flutter_mobx/services/user.helper.dart';
import 'package:jh_flutter_mobx/stores/error/error_store.dart';
import 'package:jh_flutter_mobx/utils/helper.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore implements Store {

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  User userProfile;

  @observable
  List<User> userList ;

  @observable
  int totalUser = 0;

  @observable
  bool success = false;

  @observable
  bool loading = false;


  // actions:-------------------------------------------------------------------
  @action
  Future getUserList() async{ 
    users().then((data)=> userList = data); 
    //print(userList[0].firstName);
  }

  @action
  getProfile() async {
    String profile = await restGet(API_ACCOUNT,true,false);
      setPrefs(PROFILE, profile);

      userProfile = User.fromJson(json.decode(profile));
      print('<<<<<<<<<<<<<<<<<<< '+userProfile.firstName);
  }
  /* @action
  Future getPosts() async {
    loading = true;

    Repository.instance.getPosts().then((postsList) {
      this.userProfile = postsList;
      loading = false;
      success = true;
      errorStore.showError = false;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.showError = true;
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      print(e);
    });
  } */
}