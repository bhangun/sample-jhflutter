import 'package:meta/meta.dart';
import '../../models/user.dart';

class UserState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final User user;
  final List<User> users;
  final List<dynamic> roles;
  final String error;
  final Pages pages;

  const UserState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
    this.user,
    this.users,
    this.roles,
    @required this.error,
    this.pages
  });

  factory UserState.initializing() {
    return UserState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
      error: ''
    );
  }

  factory UserState.authorizedUser(User user) {
    return UserState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      error: '',
      user: user,
      roles: user.authorities,
      pages: Pages.list
    );
  }

  factory UserState.user(User user){
    return UserState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      error: '',
      user: user,
    );
  }

  factory UserState.users(List<User> users){
    return UserState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      error: '',
      users: users,
    );
  }

  UserState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    String error,
    User user,
    List<dynamic> roles,
  }) {
    return UserState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      roles: roles ?? this.roles,
      error: error ?? this.error
    );
  }


@override
  bool operator ==( Object other) =>
      identical( this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          isAuthenticated == other.isAuthenticated  &&
          user == other.user &&
          roles == other.roles &&
          error == other.error;

@override
  int get hashCode =>
      isInitializing.hashCode ^ isAuthenticated.hashCode ^
      user.hashCode ^ roles.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'UserState { isInitializing: $isInitializing, isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated, error: $error}';
}

enum Pages { list, register, form, detail }