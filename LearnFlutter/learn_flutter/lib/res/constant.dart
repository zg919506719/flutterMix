import 'package:flutter/foundation.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  //是否运行在release环境 相当于build.isDebug
  static const bool inProduction = kReleaseMode;
}
