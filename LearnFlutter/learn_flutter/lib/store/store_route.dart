import 'package:fluro/fluro.dart';
import 'package:learn_flutter/routers/i_router.dart';
import 'package:learn_flutter/store/store_page.dart';

class StoreRoute extends IRouterProvider {
  static String auditPage = "/store/audit";

  @override
  void initRouter(FluroRouter router) {
    router.define(auditPage,
        handler: Handler(handlerFunc: (_, __) => const StorePage()));
  }
}
