import 'package:bloc_helpers/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class InitializationState extends BlocState {
  final bool isInitialized, isIntializing;
  final int progress;

  InitializationState(
      {@required this.isInitialized, this.isIntializing, this.progress});

  factory InitializationState.notInitialized() {
    return InitializationState(isInitialized: false);
  }

  factory InitializationState.progresing(int progress) {
    return InitializationState(
        isInitialized: progress == 100,
        isIntializing: true,
        progress: progress);
  }

  factory InitializationState.initialized() {
    return InitializationState(isInitialized: true, progress: 100);
  }
}
