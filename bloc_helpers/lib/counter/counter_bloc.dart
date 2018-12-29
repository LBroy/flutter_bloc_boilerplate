import 'dart:async';

import 'package:bloc_helpers/bloc_helpers/bloc_base.dart';

class CounterBloc implements BlocBase {
  int _counter;

  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController _actionController = StreamController();
  Sink get incrementCounter => _actionController.sink;

  CounterBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterController?.close();
    _actionController?.close();
  }
}
