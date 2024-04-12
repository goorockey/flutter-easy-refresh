import 'package:equatable/equatable.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocRefresherState extends Equatable {
  BlocRefresherState([this.iterable]);

  final Iterable iterable;

  /// Copy object for use in action
  BlocRefresherState getStateCopy();

  @override
  List<Object> get props => [iterable];
}

class UnBlocRefresherState extends BlocRefresherState {
  @override
  String toString() => 'UnBlocRefresherState';

  @override
  BlocRefresherState getStateCopy() {
    return UnBlocRefresherState();
  }
}

class RefreshingBlocRefresherState extends BlocRefresherState {
  final String uniqueKey;
  final RefreshBoxDirectionStatus refreshBoxDirectionStatus;
  RefreshingBlocRefresherState(
      {@required this.uniqueKey, this.refreshBoxDirectionStatus})
      : super([uniqueKey, refreshBoxDirectionStatus]);

  @override
  String toString() => 'RefreshingBlocRefresherState';

  @override
  BlocRefresherState getStateCopy() {
    return RefreshingBlocRefresherState(
        uniqueKey: uniqueKey,
        refreshBoxDirectionStatus: refreshBoxDirectionStatus);
  }
}

class RefreshedBlocRefresherState extends BlocRefresherState {
  final String uniqueKey;
  final RefreshBoxDirectionStatus refreshBoxDirectionStatus;
  RefreshedBlocRefresherState(
      {@required this.uniqueKey, this.refreshBoxDirectionStatus})
      : super([uniqueKey, refreshBoxDirectionStatus]);

  @override
  String toString() => 'RefreshedBlocRefresherState';

  @override
  BlocRefresherState getStateCopy() {
    return RefreshedBlocRefresherState(
        uniqueKey: uniqueKey,
        refreshBoxDirectionStatus: refreshBoxDirectionStatus);
  }
}
