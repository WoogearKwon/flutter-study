import 'dart:async';
import '../ticker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration = 60;

  StreamSubscription<int> _tickerSubsription;


  TimerBloc({@required Ticker ticker}) : assert(ticker != null), _ticker = ticker ;

  @override
  TimerState get initialState => TimerInitial(_duration);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    } else if (event is TimerPaused) {
      yield* _mapTimerPausedState(event);
    } else if (event is TimerResumed) {
      yield* _mapTimerResumedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubsription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInProgress(start.duration);
    _tickerSubsription?.cancel();
    _tickerSubsription = _ticker
    .tick(ticks: start.duration)
    .listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0 ? TimerRunInProgress(tick.duration) : TimerRunComplete();
  }

  Stream<TimerState> _mapTimerPausedState(TimerPaused pause) async* {
    if (state is TimerRunInProgress) {
      _tickerSubsription?.pause();
      yield TimerRunPause(state.duration);
    }
  }

  Stream<TimerState> _mapTimerResumedToState(TimerResumed resume) async* {
    if (state is TimerRunPause) {
      _tickerSubsription?.resume();
      yield TimerRunInProgress(state.duration);
    }
  }

  Stream<TimerState> _mapTimerResetToState(TimerReset reset) async* {
    _tickerSubsription?.cancel();
    yield TimerInitial(_duration);
  }
}
