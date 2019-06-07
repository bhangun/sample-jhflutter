import 'dart:async';
import 'package:jh_flutter_mobx/models/post/post_list.dart';
import 'package:jh_flutter_mobx/services/network/constants/endpoints.dart';
import 'package:jh_flutter_mobx/services/network/dio_client.dart';
import 'package:jh_flutter_mobx/services/network/exceptions/network_exceptions.dart';
import 'package:jh_flutter_mobx/services/network/rest_client.dart';


class PostApi {
  // singleton object
  static final PostApi _singleton = PostApi._();

  // A private constructor. Allows us to create instances of PostApi
  // only from within the PostApi class itself.
  PostApi._();

  // factory method to return the same object each time its needed
  factory PostApi() => _singleton;

  // Singleton accessor
  static PostApi get instance => _singleton;

  // rest client
  final _restClient = RestClient.instance;
  final _dioClient = DioClient.instance;

  /// Returns list of post in response
  Future<PostsList> getPosts() {
    return _dioClient
        .get(Endpoints.getPosts)
        .then((dynamic res) => PostsList.fromJson(res))
        .catchError((error) => throw error);
  }

/// sample api call with default rest client
 /* Future<PostsList> getPosts() {
    return _restClient
        .get(Endpoints.getPosts)
        .then((dynamic res) => PostsList.fromJson(res))
        .catchError((error) => throw NetworkException(message: error));
  } */
}