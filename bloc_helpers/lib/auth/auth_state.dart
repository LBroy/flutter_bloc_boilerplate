import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class AuthState extends BlocState {
  final bool authed, authing, failed;
  final String name;

  AuthState(
      {@required this.authed,
      this.authing: false,
      this.failed: false,
      this.name: ''});

  factory AuthState.notAuthed() {
    return AuthState(authed: false);
  }

  factory AuthState.authed(String name) {
    return AuthState(authed: true, name: name);
  }

  factory AuthState.authing() {
    return AuthState(authed: false, authing: true);
  }

  factory AuthState.failed() {
    return AuthState(authed: false, failed: true);
  }
}
