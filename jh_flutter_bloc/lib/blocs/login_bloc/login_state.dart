import 'package:meta/meta.dart';

class LoginState {
  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String status;
  final String error;
  final String token;

  const LoginState({
    @required this.isLoading,
    @required this.isLoginButtonEnabled,
    @required this.status,
    @required this.error,
    @required this.token,
  });

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      status: 'Initial',
      error: '-',
      token: '',
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isLoading: true,
      isLoginButtonEnabled: false,
      status: 'Loading',
      error: '-',
      token: '',
    );
  }

  factory LoginState.failure(String error) {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      status: 'Failure',
      error: error,
      token: '',
    );
  }

  factory LoginState.success(String token) {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      status: 'Success',
      error: '-',
      token: token,
    );
  }

  @override
  String toString() =>
      'LoginState { isLoading: $isLoading, isLoginButtonEnabled: $isLoginButtonEnabled, status: $status, error: $error, token: $token }';
}