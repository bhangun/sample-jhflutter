import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth_bloc/auth.dart';
import 'pages/login.dart';
import 'package:jh_flutter_sample/pages/home.dart';
import 'package:jh_flutter_sample/pages/splash.dart';


void main() => runApp(new App());


class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final AuthenticationBloc _authBloc = AuthenticationBloc();

  AppState() {
    _authBloc.onAppStart();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authBloc,
      child: MaterialApp(
        home: _rootPage(),
      ),
    );
  }

  Widget _rootPage() {
    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        List<Widget> widgets = [];

        if (state.isAuthenticated) {
          widgets.add(HomePage());
        } else {
          widgets.add(LoginPage());
        }

        if (state.isInitializing) {
          widgets.add(SplashPage());
        }

        if (state.isLoading) {
          widgets.add(_loadingIndicator());
        }

        return Stack(
          children: widgets,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
