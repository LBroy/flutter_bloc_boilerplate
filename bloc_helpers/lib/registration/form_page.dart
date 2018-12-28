import 'package:bloc_helpers/registration/form_bloc.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FormBloc _formBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formBloc = FormBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _formBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _formBloc.email,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    errorText: snapshot.error,
                  ),
                  obscureText: false,
                  onChanged: _formBloc.onEmailChanged,
                );
              },
            ),
            StreamBuilder(
              stream: _formBloc.password,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    errorText: snapshot.error,
                  ),
                  obscureText: true,
                  onChanged: _formBloc.onPasswordChanged,
                );
              },
            ),
            StreamBuilder(
              stream: _formBloc.confirmPassword,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'confirm password',
                    errorText: snapshot.error,
                  ),
                  obscureText: false,
                  onChanged: _formBloc.onPasswordConfirmChanged,
                );
              },
            ),
            StreamBuilder(
              stream: _formBloc.registraValid,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return RaisedButton(
                  child: Text("register"),
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          //launch sth
                        }
                      : null,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
