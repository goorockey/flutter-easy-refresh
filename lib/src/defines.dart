import 'dart:async';

import 'package:flutter/material.dart';

typedef Future<void> OnRefresh();
typedef Future<void> LoadMore();
typedef void HeaderStatusChanged(HeaderStatus status);
typedef void FooterStatusChanged(FooterStatus status);
typedef void HeaderHeightChanged(double height);
typedef void FooterHeightChanged(double height);
typedef Widget RefresherTransitionBuilder(
    BuildContext context, Widget child, ScrollController scrollController);
typedef void AnimationStateChanged(AnimationStates animationStates,
    RefreshBoxDirectionStatus refreshBoxDirectionStatus);

enum RefreshBoxDirectionStatus {
  // 上拉加载的状态 分别为 闲置 上拉  下拉
  IDLE,
  PUSH,
  PULL
}

/// Header状态
enum HeaderStatus { START, READY, REFRESHING, REFRESHED, RESTORE, END, CLOSE }

/// Footer状态
enum FooterStatus {
  START,
  READY,
  LOADING,
  LOADED,
  NO_MORE,
  RESTORE,
  END,
  CLOSE
}

enum AnimationStates {
  // 未达到刷新高度
  DragAndRefreshNotEnabled,
  // 达到刷新高度
  DragAndRefreshEnabled,
  // 开始加载
  StartLoadData,
  // 加载完成
  LoadDataEnd,
  // 视图消失
  RefreshBoxIdle
}
