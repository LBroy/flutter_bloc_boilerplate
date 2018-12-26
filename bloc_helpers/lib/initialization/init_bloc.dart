import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';
import 'package:bloc_helpers/initialization/init_event.dart';
import 'package:bloc_helpers/initialization/init_state.dart';

class InitializationBloc
    extends BlocEventStateBase<InitializationEvent, InitializationState> {
  InitializationBloc()
      : super(initialState: InitializationState.notInitialized());

  @override
  Stream<InitializationState> eventHandler(
      InitializationEvent event, InitializationState currentState) async* {
    if (!currentState.isInitialized) {
      yield InitializationState.notInitialized();
    }

    if (event.type == InitializationEventType.start) {
      for (int progress = 0; progress < 101; progress += 10) {
        await Future.delayed(Duration(milliseconds: 300));
        yield InitializationState.progresing(progress);
      }
    }

    if (event.type == InitializationEventType.stop) {
      yield InitializationState.initialized();
    }
  }
}
