//捕获全局异常，进行统一处理
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/constant.dart';

void handleError(void Function() body) {
  //
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!Constant.inProduction) {
      //debug
      FlutterError.dumpErrorToConsole(details);
    } else {
      //release 统一用zone处理
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded(body, (error, stack) {
    _reportError(error, stack);
  });
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  /// 将异常信息收集并上传到服务器。可以直接使用类似`flutter_bugly`插件处理异常上报。
}
