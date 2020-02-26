import 'package:fluro/fluro.dart';
import 'package:flutter_talk/common/pages/photo_view_gallery_screen.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_detail_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_video_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/search_page.dart';
import 'package:flutter_talk/pages/message/pages/private_chat_page.dart';
import 'package:flutter_talk/routers/router_init.dart';


class MessagesRouter implements IRouterProvider {
  static String privateChatPage = "/privateChatPage";

  var photoViewGalleryScreenHandler = Handler(handlerFunc: (_, params) {
    // 利用id 传递值
    String id = params['id'][0];
    return PhotoViewGalleryScreen();
  });

  @override
  void initRouter(Router router) {

    router.define(privateChatPage, handler: Handler(handlerFunc: (_, params) => PrivateChatPage()));

  }

}



