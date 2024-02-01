import 'package:fluro/fluro.dart';
import 'package:learn_flutter/routers/i_router.dart';
import 'package:learn_flutter/table/table_page.dart';

class TableRouter extends IRouterProvider {
  static String tableRoute = "/table";

  @override
  void initRouter(FluroRouter router) {
    router.define(tableRoute,
        handler: Handler(handlerFunc: (context, parameters) => TablePage()));
  }
}
