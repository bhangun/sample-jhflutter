import 'package:meta/meta.dart';

class ApplicationState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;

  const ApplicationState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
  });

  factory ApplicationState.initializing() {
    return ApplicationState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  factory ApplicationState.authenticated() {
    return ApplicationState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
    );
  }

  factory ApplicationState.unauthenticated() {
    return ApplicationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  ApplicationState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
  }) {
    return ApplicationState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() =>
      'ApplicationState { isInitializing: $isInitializing, isLoading: $isLoading, isAuthenticated: $isAuthenticated }';
}