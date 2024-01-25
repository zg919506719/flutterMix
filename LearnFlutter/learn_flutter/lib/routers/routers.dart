import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../home/home_page.dart';
import 'not_found_page.dart';

class Routes {
  static final FluroRouter router = FluroRouter();
  static String home = "/home";

  static void initRoutes() {
    //指定路由错误返回页
    router.notFoundHandler = Handler(handlerFunc: (
      BuildContext? context,
      Map<String, List<String>> parameters,
    ) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    router.define(home,
        handler: Handler(
            handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) =>
                const Home()));
  }
}
