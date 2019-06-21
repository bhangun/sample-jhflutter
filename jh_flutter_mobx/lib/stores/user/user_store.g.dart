// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserStore on _UserStore, Store {
  final _$userProfileAtom = Atom(name: '_UserStore.userProfile');

  @override
  User get userProfile {
    _$userProfileAtom.reportObserved();
    return super.userProfile;
  }

  @override
  set userProfile(User value) {
    _$userProfileAtom.context
        .checkIfStateModificationsAreAllowed(_$userProfileAtom);
    super.userProfile = value;
    _$userProfileAtom.reportChanged();
  }

  final _$userListAtom = Atom(name: '_UserStore.userList');

  @override
  List<User> get userList {
    _$userListAtom.reportObserved();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.context.checkIfStateModificationsAreAllowed(_$userListAtom);
    super.userList = value;
    _$userListAtom.reportChanged();
  }

  final _$totalUserAtom = Atom(name: '_UserStore.totalUser');

  @override
  int get totalUser {
    _$totalUserAtom.reportObserved();
    return super.totalUser;
  }

  @override
  set totalUser(int value) {
    _$totalUserAtom.context
        .checkIfStateModificationsAreAllowed(_$totalUserAtom);
    super.totalUser = value;
    _$totalUserAtom.reportChanged();
  }

  final _$successAtom = Atom(name: '_UserStore.success');

  @override
  bool get success {
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.checkIfStateModificationsAreAllowed(_$successAtom);
    super.success = value;
    _$successAtom.reportChanged();
  }

  final _$loadingAtom = Atom(name: '_UserStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.checkIfStateModificationsAreAllowed(_$loadingAtom);
    super.loading = value;
    _$loadingAtom.reportChanged();
  }

  final _$getUserListAsyncAction = AsyncAction('getUserList');

  @override
  Future<dynamic> getUserList() {
    return _$getUserListAsyncAction.run(() => super.getUserList());
  }

  final _$getProfileAsyncAction = AsyncAction('getProfile');

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }
}
