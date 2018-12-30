import 'dart:async';

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final StreamController<int> _counterController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _counterController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc Pattern"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            StreamBuilder<int>(
              stream: _counterController.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('${snapshot.data}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter = _counter + 1;
          _counterController.sink.add(_counter);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
