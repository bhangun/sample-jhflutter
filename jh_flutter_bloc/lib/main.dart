import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/bloc/auth_bloc.dart';
import 'package:jh_flutter_sample/bloc/auth_event.dart';
import 'package:jh_flutter_sample/bloc/auth_state.dart';
import 'package:jh_flutter_sample/login.dart';
import 'package:jh_flutter_sample/pages/home.dart';
import 'package:jh_flutter_sample/pages/splash.dart';
import 'app.dart';

void main() => runApp(new App());


class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final AuthenticationBloc _authenticationBloc = AuthenticationBloc();

  AppState() {
    _authenticationBloc.onAppStart();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        home: _rootPage(),
      ),
    );
  }

  Widget _rootPage() {
    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authenticationBloc,
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
