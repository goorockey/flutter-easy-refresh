import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyrefresh/src/bloc_refresher_event.dart';
import 'package:flutter_easyrefresh/src/bloc_refresher_state.dart';

class BlocRefresherBloc extends Bloc<BlocRefresherEvent, BlocRefresherState> {
  static final BlocRefresherBloc _blocRefresherBlocSingleton =
      new BlocRefresherBloc._internal();
  factory BlocRefresherBloc() {
    return _blocRefresherBlocSingleton;
  }
  BlocRefresherBloc._internal();

  BlocRefresherState get initialState => new UnBlocRefresherState();

  @override
  Stream<BlocRefresherState> mapEventToState(
    BlocRefresherEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_) {
      print('BlocRefresherBloc ' + _?.toString());
      yield currentState;
    }
  }
}
