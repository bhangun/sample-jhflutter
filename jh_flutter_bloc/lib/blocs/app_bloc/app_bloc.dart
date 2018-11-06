import 'dart:async';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';
import 'package:jh_flutter_sample/services/services.dart';



class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {

  @override
  ApplicationState get initialState {
    print("--------ApplicationState get initialState----------");
    return ApplicationState.initializing();
  }

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLoggedIn({@required String token}) {
    dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    dispatch(LoggedOut());
  }

  
  @override
  Stream<ApplicationState> mapEventToState(
      ApplicationState state, ApplicationEvent event) async* {
    
    if (event is AppStarted) {
      print("------AppStarted 1--------");
      final bool hasToken = await _hasToken();

     /*  if (hasToken) {
        yield ApplicationState.authenticated();
      } else {
        yield ApplicationState.unauthenticated();
      } */
    }

    if (event is LoggedIn) {
      print("------LoggedIn--------");
      yield state.copyWith(isLoading: true);

      await _fetchProfile(event.token);
            //yield ApplicationState.authenticated();
    }
      
    if (event is LoggedOut) {
            print("------LoggedOut--------");
            yield state.copyWith(isLoading: true);
      
            await _deleteToken();
            //yield ApplicationState.unauthenticated();
    }
  }
      
        Future<void> _deleteToken() async {
         removePrefs(TOKEN);
        }
      
        Future<void> _persistToken(String token) async {
          setPrefs(TOKEN,token);
        }
      
        Future<bool> _hasToken() async {
          bool _isTrue=false;
          prefs(TOKEN).then((v)=> _isTrue=v.isNotEmpty);
          return _isTrue;
          
        }
      
        _fetchProfile(String token) async{
          JWT jj = await jwt();
          print(jj.getClaim("auth"));
        }
        
}