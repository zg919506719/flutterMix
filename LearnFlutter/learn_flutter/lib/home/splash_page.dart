import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:learn_flutter/login/login_router.dart';
import 'package:learn_flutter/routers/fluro_navigator.dart';
import 'package:learn_flutter/routers/not_found_page.dart';
import 'package:learn_flutter/util/image_utils.dart';
import 'package:learn_flutter/util/theme_utils.dart';
import 'package:learn_flutter/widgets/load_image.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sp_util/sp_util.dart';

import '../res/constant.dart';
import '../util/app_navigator.dart';
import '../util/device_utils.dart';
import '../widgets/fractionally_aligned_sized_box.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _status = 0;
  final List<String> _guideList = ['app_start_1', 'app_start_2', 'app_start_3'];
  StreamSubscription<dynamic>? _subscription;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.backgroundColor,
      child: _status == 0
          ? const FractionallyAlignedSizedBox(
        heightFactor: 0.3,
        widthFactor: 0.33,
        leftFactor: 0.33,
        bottomFactor: 0,
        child: LoadAssetImage("logo"),
      )
          : Swiper(
          itemBuilder: (context, index) {
            return LoadAssetImage(_guideList[index],
                key: Key(_guideList[index]),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                format: ImageFormat.webp);
          },
          onIndexChanged: (index) {},
          onTap: (index) {
            if (index == _guideList.length - 1) {
              _goLogin();
            }
          },
          itemCount: _guideList.length),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /// 两种初始化方案，另一种见 main.dart
      /// 两种方法各有优劣
      await SpUtil.getInstance();
      await Device.initDeviceInfo();
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)!) {
        //预先缓存图片，避免直接使用时因为首次加载造成闪动
        void preCacheImages(String image) {
          precacheImage(
              ImageUtils.getAssetImage(image, format: ImageFormat.webp),
              context);
        }

        _guideList.forEach(preCacheImages);
      }
      _initSplash();
    });

    if (Device.isAndroid) {
      const QuickActions quickActions = QuickActions();
      quickActions.initialize((type) {
        if (type == "demo") {
          AppNavigator.pushReplacement(context, const NotFoundPage());
          _subscription?.cancel();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  void _initSplash() {
    _subscription = Stream.value(1)
        .delay(const Duration(milliseconds: 1500))
        .listen((event) {
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)! ||
          Constant.isDriverTest) {
        _initGuide();
      } else {
        _goLogin();
      }
    });
  }

  void _initGuide() {
    setState(() {
      _status++;
    });
  }

  void _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage);
  }
}
