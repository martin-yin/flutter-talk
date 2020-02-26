import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_talk/pages/dynamic/provider/dynamic_page_provider.dart';
import 'package:flutter_talk/pages/home_page.dart';
import 'package:flutter_talk/pages/message/pages/private_chat_page.dart';
import 'package:flutter_talk/provider/common_provider.dart';
import 'package:flutter_talk/routers/application.dart';
import 'package:flutter_talk/routers/routers.dart';
import 'package:provider/provider.dart';

void main() {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;
  runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  CommonProvider provider = CommonProvider();

  MyApp() {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommonProvider>(
        create: (_) => provider,
        child: Consumer<CommonProvider>(builder: (_, provider, __) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                color: Colors.white,
                brightness: Brightness.dark,
              ),
              accentColor: Color(0xFFff7faa),
            ),
            onGenerateRoute: Application.router.generator,
            home: HomePage(),
          );
        }));
  }
}

class DarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Scaffold(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.0);
}
