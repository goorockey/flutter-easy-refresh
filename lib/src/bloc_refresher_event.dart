import 'dart:async';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/src/bloc_refresher_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocRefresherEvent {
  Future<BlocRefresherState> applyAsync(
      {BlocRefresherState currentState, BlocRefresherBloc bloc});
}

class RefreshingBlocRefresherEvent extends BlocRefresherEvent {
  final String uniqueKey;
  final RefreshBoxDirectionStatus refreshBoxDirectionStatus;
  RefreshingBlocRefresherEvent(
      {@required this.uniqueKey, this.refreshBoxDirectionStatus});

  @override
  String toString() => 'RefreshingBlocRefresherEvent';

  @override
  Future<BlocRefresherState> applyAsync(
      {BlocRefresherState currentState, BlocRefresherBloc bloc}) async {
    return RefreshingBlocRefresherState(
        uniqueKey: uniqueKey,
        refreshBoxDirectionStatus: refreshBoxDirectionStatus);
  }
}

class RefreshedBlocRefresherEvent extends BlocRefresherEvent {
  final String uniqueKey;
  RefreshedBlocRefresherEvent({this.uniqueKey});

  @override
  String toString() => 'RefreshedBlocRefresherEvent';

  @override
  Future<BlocRefresherState> applyAsync(
      {BlocRefresherState currentState, BlocRefresherBloc bloc}) async {
    if (currentState is RefreshingBlocRefresherState) {
      return RefreshedBlocRefresherState(
          uniqueKey: uniqueKey,
          refreshBoxDirectionStatus: currentState.refreshBoxDirectionStatus);
    }
    return currentState;
  }
}
