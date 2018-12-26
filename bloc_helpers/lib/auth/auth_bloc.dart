import 'package:bloc_helpers/auth/auth_event.dart';
import 'package:bloc_helpers/auth/auth_state.dart';
import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';

class AuthBloc extends BlocEventStateBase<AuthEvent, AuthState> {
  AuthBloc() : super(initialState: AuthState.notAuthed());

  @override
  Stream<AuthState> eventHandler(
      AuthEvent event, AuthState currentState) async* {
    if (event is AuthEventLogin) {
      yield AuthState.authing();

      await Future.delayed(Duration(seconds: 2));

      if (event.name == 'failure') {
        yield AuthState.failed();
      } else {
        yield AuthState.authed(event.name);
      }
    }

    if (event is AuthEventLogout) {
      yield AuthState.notAuthed();
    }

    if (event is AuthEventLogout) {}
  }
}
