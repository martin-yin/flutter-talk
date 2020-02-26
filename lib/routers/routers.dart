import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_talk/pages/discovery/discovery_router.dart';
import 'package:flutter_talk/pages/dynamic/dynamics_router.dart';
import 'package:flutter_talk/pages/home_page.dart';
import 'package:flutter_talk/pages/message/messages_router.dart';
import 'package:flutter_talk/pages/user/users_router.dart';
import 'package:flutter_talk/routers/router_init.dart';

import '404.dart';

class Routers {
  static String home = '/home';

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NotFoundPage();
      }
    );
    router.define(home, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) => HomePage()));

    _listRouter.clear();
    _listRouter.add(DynamicsRouter());
    _listRouter.add(DiscoveryRouter());
    _listRouter.add(MessagesRouter());

    _listRouter.add(UsersRouter());


    // 遍历路由~
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}