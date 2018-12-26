import 'package:bloc_helpers/bloc_helpers/bloc_state_builder.dart';
import 'package:bloc_helpers/initialization/init_bloc.dart';
import 'package:bloc_helpers/initialization/init_event.dart';
import 'package:bloc_helpers/initialization/init_state.dart';
import 'package:flutter/material.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  InitializationBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc = InitializationBloc();
    bloc.emitEvent(InitializationEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext pageContext) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: BlocEventStateBuilder<InitializationState>(
              bloc: bloc,
              builder: (BuildContext context, InitializationState state) {
                if (state.isInitialized) {
                  //
                  // Once the initialization is complete, let's move to another page
                  //
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  });
                }
                return Text('Initialization in progress... ${state.progress}%');
              },
            ),
          ),
        ),
      ),
    );
  }
}
