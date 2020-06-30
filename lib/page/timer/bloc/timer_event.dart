import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// TimerStarted — informs the TimerBloc that the timer should be started.
/// TimerPaused — informs the TimerBloc that the timer should be paused.
/// TimerResumed — informs the TimerBloc that the timer should be resumed.
/// TimerReset — informs the TimerBloc that the timer should be reset to the original state.
/// TimerTicked — informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];

}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({@required this.duration});

  @override
  String toString() => 'TimerStarted { duration: $duration }';
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => 'TimerTicked { duration: $duration }';
}