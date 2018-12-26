import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';

class InitializationEvent extends BlocEvent {
  final InitializationEventType type;

  InitializationEvent({this.type: InitializationEventType.start})
      : assert(type != null);
}

enum InitializationEventType {
  start,
  stop,
}
