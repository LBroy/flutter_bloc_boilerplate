import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';

abstract class AuthEvent extends BlocEvent {
  final String name;
  AuthEvent({this.name = ''});
}

class AuthEventLogin extends AuthEvent {
  AuthEventLogin({
    String name,
  }) : super(name: name);
}

class AuthEventLogout extends AuthEvent {}
