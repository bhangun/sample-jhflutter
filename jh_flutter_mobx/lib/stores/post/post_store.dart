
import 'package:jh_flutter_mobx/models/post/post_list.dart';
import 'package:jh_flutter_mobx/services/repository.dart';
import 'package:jh_flutter_mobx/stores/error/error_store.dart';
import 'package:jh_flutter_mobx/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore implements Store {

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  PostsList postsList;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    loading = true;

    Repository.instance.getPosts().then((postsList) {
      this.postsList = postsList;
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
  }
}