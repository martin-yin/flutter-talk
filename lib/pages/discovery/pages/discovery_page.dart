import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/discovery/pages/topic_page.dart';
import 'package:flutter_talk/pages/discovery/pages/toview_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_list_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_selfie_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_video_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/follow_page.dart';

import '../../../main.dart';
import 'accompany_page.dart';
import 'nearby_page.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with
        AutomaticKeepAliveClientMixin<DiscoveryPage>,
        SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  var pageList = [
    TopicPage(),
    NearbyPage(),
    AccompanyPage(),
    ToviewPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, vsync: this, length: pageList.length);
  }

  _onPageChange(int index) async {
    _tabController.animateTo(index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: DarkAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: TabBar(
                  labelColor: Color(0xFF0a0f1e),
                  indicatorColor: Color(0xffFF7E98),
                  tabs: <Widget>[
                    Tab(text: "话题"),
                    Tab(text: "附近"),
                    Tab(text: "约伴"),
                    Tab(text: "看法"),
                  ],
                  controller: _tabController,
                  indicatorWeight: 3,
                  indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                  labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xffFF7E98),
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelColor: Color(0xff999999),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 14, color: Color(0xff999999)),
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (index) {
                    _pageController.jumpToPage(index);
                  },
                ),
              ))
            ]),
            Expanded(
              child: PageView.builder(
                  key: const Key('pageView'),
                  itemCount: pageList.length,
                  onPageChanged: _onPageChange,
                  controller: _pageController,
                  itemBuilder: (_, index) => pageList[index]),
            )
          ],
        ));
  }
}
