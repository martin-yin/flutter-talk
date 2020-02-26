import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/discovery/pages/discovery_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_video_page.dart';
import 'package:flutter_talk/pages/message/pages/message_page.dart';
import 'package:flutter_talk/pages/provider/home_provider.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController controller;
  final _pageController = PageController();
  HomeProvider provider = HomeProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => provider,
        child: Scaffold(
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                DynamicPage(),
                DiscoveryPage(),
                Container(),
                MessagePage(),
                UserPage(),
              ],
              physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar:
                Consumer<HomeProvider>(builder: (_, provider, __) {
              return BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          IconFont.icon_xingqiu,
                          size: 30,
                        ),
                        icon: Icon(
                          IconFont.icon_xingqiu,
                          size: 30,
                        ),
                        title: Container()),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          IconFont.icon_redu,
                          size: 30,
                        ),
                        icon: Icon(
                          IconFont.icon_redu,
                          size: 30,
                        ),
                        title: Container()),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          'assets/images/bottom_add.png',
                          width: 26,
                        ),
                        title: Text('')),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          IconFont.icon_duihua,
                          size: 30,
                        ),
                        icon: Icon(
                          IconFont.icon_duihua,
                          size: 30,
                        ),
                        title: Container()),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          IconFont.icon_yonghu,
                          size: 30,
                        ),
                        icon: Icon(
                          IconFont.icon_yonghu,
                          size: 30,
                        ),
                        title: Container()),
                  ],
                  type: BottomNavigationBarType.fixed,
                  elevation: 5.0,
                  iconSize: 21.0,
                  selectedFontSize: 10,
                  currentIndex: provider.value,
                  unselectedFontSize: 10,
                  selectedItemColor: Color(0xffFF7E98),
                  backgroundColor: Colors.white,
                  onTap: (index) {
                    if (index == 2) {
                      return print('111');
                    }
                    _pageController.jumpToPage(index);
                  });
            })));
  }

  _onPageChanged(index) {
    provider.value = index;
  }
}
