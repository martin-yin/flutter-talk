import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_talk/main.dart';
import 'package:flutter_talk/pages/dynamic/dynamics_router.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_selfie_page.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_video_page.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/util/icon_font.dart';

import 'dynamic_list_page.dart';
import 'follow_page.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage>
    with
        AutomaticKeepAliveClientMixin<DynamicPage>,
        SingleTickerProviderStateMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  TabController _tabController;
  PageController _pageController = PageController(initialPage: 1);
  var pageList = [
    FollowPage(),
    DynamicListPage(),
    DynamicSelfiePage(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 1, vsync: this, length: pageList.length);
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DarkAppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      labelColor: Color(0xFF0a0f1e),
                      indicatorColor: Color(0xffFF7E98),
                      tabs: <Widget>[
                        Tab(text: "关注"),
                        Tab(text: "推荐"),
                        Tab(text: "自拍"),
                        Tab(text: "视频"),
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
                  ),
                  FlatButton(
                    onPressed: () {
                      NavigatorUtils.push(context, DynamicsRouter.searchPage);
                    },
                    child: Icon(
                      IconFont.icon_sousuo,
                      size: 24,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: PageView.builder(
                    key: const Key('pageView'),
                    itemCount: pageList.length,
                    onPageChanged: _onPageChange,
                    controller: _pageController,
                    itemBuilder: (_, index) => pageList[index]),
              ),


            ],
          ),
        ));
  }
}





class MyPainterLeft extends CustomPainter {

  final Color LineColor;

  Paint _paint = Paint()
    ..strokeCap = StrokeCap.square //画笔笔触类型
    ..isAntiAlias = true;//是否启动抗锯齿//画笔的宽度
  Path _path = new Path();

  MyPainterLeft(this.LineColor);

  @override
  Future paint(Canvas canvas, Size size) {
    _paint.style = PaintingStyle.stroke; // 画线模式
    _paint.color = this.LineColor;
    _paint.strokeWidth = 1;
    _path.moveTo(0, 0);
    _path.lineTo(0, size.height); // 画条斜线

    canvas.drawPath(_path, _paint);

    Paint _circularPaint = new Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(0, 3),
        3,
        _circularPaint
          ..color = _paint.color
          ..style = PaintingStyle.fill
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

