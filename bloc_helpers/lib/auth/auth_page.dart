import 'package:bloc_helpers/auth/auth_bloc.dart';
import 'package:bloc_helpers/auth/auth_event.dart';
import 'package:bloc_helpers/auth/auth_state.dart';
import 'package:bloc_helpers/bloc_helpers/bloc_provider.dart';
import 'package:bloc_helpers/bloc_helpers/bloc_state_builder.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  Future<bool> _onWillPopScoper() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    return WillPopScope(
      onWillPop: _onWillPopScoper,
      child: Scaffold(
        body: Container(
          child: BlocEventStateBuilder<AuthState>(
              bloc: bloc,
              builder: (BuildContext context, AuthState state) {
                if (state.authing) {
                  return null;
                }

                if (state.authed) {
                  return Container();
                }

                List<Widget> children = [];

                // Button to fake the authentication (success)
                children.add(
                  ListTile(
                    title: RaisedButton(
                      child: Text('Log in (success)'),
                      onPressed: () {
                        bloc.emitEvent(AuthEventLogin(name: 'Didier'));
                      },
                    ),
                  ),
                );

                // Button to fake the authentication (failure)
                children.add(
                  ListTile(
                    title: RaisedButton(
                      child: Text('Log in (failure)'),
                      onPressed: () {
                        bloc.emitEvent(AuthEventLogin(name: 'failure'));
                      },
                    ),
                  ),
                );

                // Display a text if the authentication failed
                if (state.failed) {
                  children.add(
                    Text('Authentication failure!'),
                  );
                }

                return Column(
                  children: children,
                );
              }),
        ),
      ),
    );
  }
}
