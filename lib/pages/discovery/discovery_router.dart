import 'package:fluro/fluro.dart';
import 'package:flutter_talk/pages/discovery/pages/discovery_page.dart';
import 'package:flutter_talk/pages/discovery/pages/nearby_list_page.dart';
import 'package:flutter_talk/pages/discovery/pages/topic_detail_page.dart';
import 'package:flutter_talk/routers/router_init.dart';

class DiscoveryRouter implements IRouterProvider {
  static String discoveryPage = "/discoveryPage";

  static String topicDetailPage = "/topicDetailPage";
  static String nearListPage = "/nearbyListPage";

  @override
  void initRouter(Router router) {
    router.define(discoveryPage, handler: Handler(handlerFunc: (_, params) => DiscoveryPage()));
    router.define(topicDetailPage, handler: Handler(handlerFunc: (_, params) => TopicDetailPage()));

    router.define(nearListPage, handler: Handler(handlerFunc: (_, params) => NearbyListPage()));

  }

}



