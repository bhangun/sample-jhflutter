import 'package:jh_flutter_sample/blocs/auth_bloc/auth.dart';
import 'package:test/test.dart';


void main() {
  AuthenticationBloc loginBloc;

  setUp(() {
    loginBloc = AuthenticationBloc();
  });

  test('initial state is correct', () {
    expect(AuthenticationState.initial(), loginBloc.initialState);
  });

  test('dispose does not emit new states', () {
    expectLater(
      loginBloc.state,
      emitsInOrder([]),
    );
    loginBloc.dispose();
  });


  test('Check auth', () {
    expectLater(
      loginBloc.state,
      emitsInOrder([
         AuthenticationState.authenticated()
      ]),
    );
    loginBloc.dispatch(LoggedIn(token: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU0MTgwNTg5OX0.R6qk9kdW47-Pgap7isyzvvo'+
'wGOG2R99mTrg4Oud5Bd7UBYgrCZsFw6FqwdgxdUcOLGlIvWJv7kC6wZqtXi3cjg'));
  });

  group('LoginButtonPressed', () {
    test('emits token on success', () {
      final expectedResponse = [
        AuthenticationState.loading(),
        AuthenticationState.success('bbb'),
      ];

      expectLater(
        loginBloc.state,
        emitsInOrder(expectedResponse),
      );

      loginBloc.onLoginButtonPressed(username: 'valid.username',
        password: 'valid.password',
        rememberMe: true); 

      loginBloc.dispatch(LoginButtonPressed(
        username: 'valid.username',
        password: 'valid.password',
        rememberMe: true
      ));  

      
    });
  });
}