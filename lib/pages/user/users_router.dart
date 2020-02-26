import 'package:fluro/fluro.dart';
import 'package:fluro/src/router.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/routers/router_init.dart';


class UsersRouter extends IRouterProvider {
  static String userPage = "/userPage";

  @override
  void initRouter(Router router) {
    router.define(userPage, handler: Handler(handlerFunc: (_, params) => UserPage()));
  }

}