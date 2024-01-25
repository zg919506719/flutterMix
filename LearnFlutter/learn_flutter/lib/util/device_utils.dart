import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class Device {
  static bool get isWeb => kIsWeb;
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;

  static bool get isWindows => !isWeb && Platform.isWindows;

  static bool get isLinux => !isWeb && Platform.isLinux;

  static bool get isMacOS => !isWeb && Platform.isMacOS;

  static bool get isAndroid => !isWeb && Platform.isAndroid;

  static bool get isFuchsia => !isWeb && Platform.isFuchsia;

  static bool get isIOS => !isWeb && Platform.isIOS;

  static late AndroidDeviceInfo _androidDeviceInfo;

  static Future<void> initDeviceInfo() async{
    if(isAndroid){
      final DeviceInfoPlugin deviceInfo=DeviceInfoPlugin();
      _androidDeviceInfo=await deviceInfo.androidInfo;
    }
  }
}
