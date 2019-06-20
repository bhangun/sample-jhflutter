import 'dart:async';
import 'package:jh_flutter_mobx/models/user.dart';
import 'package:jh_flutter_mobx/services/network/constants/endpoints.dart';
import 'package:jh_flutter_mobx/services/network/dio_client.dart';


class UserApi {
  // singleton object
  static final UserApi _singleton = UserApi._();

  // A private constructor. Allows us to create instances of UserApi
  // only from within the UserApi class itself.
  UserApi._();

  // factory method to return the same object each time its needed
  factory UserApi() => _singleton;

  // Singleton accessor
  static UserApi get instance => _singleton;

  // rest client
  // final _restClient = RestClient.instance;
  final _dioClient = DioClient.instance;

  /// Returns list of post in response
  Future<List<User>> getUsers() {
    return _dioClient
        .fetch(Endpoints.post('/authenticate'))
        .then((res) => User.listFromJson(res))
        .catchError((error) => throw error);
  }
}