import 'package:bloc_helpers/counter/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = CounterBloc();
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Text("you hit me: ${snapshot.data}"),
            ),
            floatingActionButton: FloatingActionButton(
              child: Text("add"),
              onPressed: () {
                bloc.incrementCounter.add(null);
              },
            ),
          );
        }
      },
    );
  }
}
