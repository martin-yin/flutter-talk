import 'package:fluro/fluro.dart';
import 'package:flutter_talk/common/pages/photo_view_gallery_screen.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_detail_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_video_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/search_page.dart';
import 'package:flutter_talk/routers/router_init.dart';


class DynamicsRouter implements IRouterProvider {
  static String dynamicPage = "/dynamicPage";
  static String dynamicDetailPage = "/dynamicDetailPage";
  static String dynamicVideoPage = "/dynamicVideoPage";
  static String photoViewGalleryScreen = "/photoViewGalleryScreen";



  static String searchPage = "/searchPage";

  var photoViewGalleryScreenHandler = Handler(handlerFunc: (_, params) {
    // 利用id 传递值
    String id = params['id'][0];
    return PhotoViewGalleryScreen();
  });

  @override
  void initRouter(Router router) {

    router.define(dynamicPage, handler: Handler(handlerFunc: (_, params) => DynamicPage()));
    router.define(dynamicDetailPage, handler: Handler(handlerFunc: (_, params) => DynamicDetailPage()));
    router.define(dynamicVideoPage, handler: Handler(handlerFunc: (_, params) => DynamicVideoPage()));

    router.define(photoViewGalleryScreen, handler: Handler(handlerFunc: (_, params) => PhotoViewGalleryScreen()));
    router.define(searchPage, handler: Handler(handlerFunc: (_, params) => SearchPage()));


  }

}



