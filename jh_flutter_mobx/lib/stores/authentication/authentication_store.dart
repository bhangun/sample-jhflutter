import 'dart:convert';

import 'package:jh_flutter_mobx/models/user.dart';
import 'package:jh_flutter_mobx/services/connection.dart';
import 'package:jh_flutter_mobx/services/sharedpref/constants/preferences.dart';
import 'package:jh_flutter_mobx/services/user.helper.dart';
import 'package:jh_flutter_mobx/stores/error/error_store.dart';
import 'package:jh_flutter_mobx/utils/config.dart';
import 'package:jh_flutter_mobx/utils/helper.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore implements Store {

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _AuthenticationStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
    ];
  }

  // store variables:-----------------------------------------------------------

  @observable
  List<User> userList ;

  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loggedIn = false;

  @observable
  bool loading = false;

  @observable
  bool rememberMe = false;

  @computed
  bool get canLogin =>
      !hasErrorsInLogin ;//&& userEmail.isNotEmpty && password.isNotEmpty;

  @computed
  bool get canRegister =>
      !hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !hasErrorInForgotPassword && userEmail.isNotEmpty;
  
  // error handling:-------------------------------------------------------------------
  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      userEmail = "Email can't be empty";
    } /* else if (!isEmail(value)) {
      userEmail = 'Please enter a valid email address';
    } */ else {
      userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      password = "Password can't be empty";
    } else if (value.length < 6) {
      password = "Password must be at-least 6 characters long";
    } else {
      password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      confirmPassword = "Password doen't match";
    } else {
      confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future getUserList() async{ 
    users().then((data)=> userList = data); 
  }

  @action
  Future login(String _username,String _password,[bool _rememberMe=false]) async {
    loading = true;
    
    //DioClient.fetch('/authenticate');

    
    var body = jsonEncode({"username": _username, "password": _password, "rememberMe": _rememberMe});
    final response = await restPost("authenticate", body);
    setPrefs(TOKEN, json.decode(response)["id_token"]);

    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });
    /* String profile = await restGet(API_ACCOUNT,true,false);
    setPrefs(PROFILE, profile); */

    loading = false;
    success = true;
    errorStore.showError = false;

    /* Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
      errorStore.showError = false;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.showError = true;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    }); */
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }
}
