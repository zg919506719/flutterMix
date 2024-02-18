import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/login/login_router.dart';
import 'package:learn_flutter/routers/i_router.dart';
import 'package:learn_flutter/store/store_route.dart';
import 'package:learn_flutter/table/table_router.dart';

import '../home/home_page.dart';
import '../shop/shop_router.dart';
import 'not_found_page.dart';

class Routes {
  static final FluroRouter router = FluroRouter();
  static String home = "/home";
  static final List<IRouterProvider> _listRouter = [];

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

    //todo web
    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(LoginRouter());
    _listRouter.add(TableRouter());
    _listRouter.add(StoreRoute());
    _listRouter.add(ShopRouter());

    //初始化路由
    void initRoute(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRoute);
  }
}
