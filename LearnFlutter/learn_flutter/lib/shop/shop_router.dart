import 'package:fluro/fluro.dart';
import 'package:learn_flutter/routers/i_router.dart';

import 'address_select_page.dart';

class ShopRouter implements IRouterProvider {
  static String addressSelectPage = "/shop/addressSelect";

  @override
  void initRouter(FluroRouter router) {
    router.define(addressSelectPage,
        handler: Handler(handlerFunc: (_, __) => const AddressSelectPage()));
  }
}
