import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:learn_flutter/login/login_page.dart';
import 'package:learn_flutter/routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage,
        handler: Handler(
            handlerFunc: (
          context,
          parameters,
        ) =>
                const LoginPage()));
  }
}
