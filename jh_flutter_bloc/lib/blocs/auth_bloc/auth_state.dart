import 'package:meta/meta.dart';

class AuthenticationState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isLoginButtonEnabled;
  final String status;
  final String error;
  final String token;

  const AuthenticationState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
     @required this.isLoginButtonEnabled,
   @required this.status,
   @required this.error,
   @required this.token
  });

  factory AuthenticationState.initializing() {
    return AuthenticationState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      status: "initializing",
      error: "",
      token: ""
    );
  }

  factory AuthenticationState.authenticated() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      isLoginButtonEnabled: false,
      status: "authenticated",
      error: "",
      token: ""
    );
  }

  factory AuthenticationState.unauthenticated() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      status: "authenticated",
      error: "",
      token: ""
    );
  }

  factory AuthenticationState.initial() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      status: 'Initial',
      error: '',
      token: '',
    );
  }

  factory AuthenticationState.loading() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: false,
      status: 'Loading',
      error: '',
      token: '',
    );
  }

  factory AuthenticationState.failure(String error) {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      status: 'Failure',
      error: error,
      token: '',
    );
  }

  factory AuthenticationState.success(String token) {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: false,
      status: 'Success',
      error: '',
      token: token,
    );
  }

  AuthenticationState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    bool isLoginButtonEnabled,
    String  status,
    String  error,
    String  token
  }) {
    return AuthenticationState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      status: status ?? this.status,
      error: error ?? this.error,
      token: token ?? this.token
    );
  }

  @override
  String toString() =>
      'AuthenticationState { isInitializing: $isInitializing,'+
      'isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated, '+
      'isLoginButtonEnabled: $isLoginButtonEnabled, '+
      'status: $status, '+
      'error: $error, '+
      'token: $token}';
}