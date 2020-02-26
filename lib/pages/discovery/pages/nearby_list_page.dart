import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/pages/discovery/widget/near_item_widget.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/app_bar.dart';
import 'package:flutter_talk/widget/gaps.dart';

import 'nearby_page.dart';

class NearbyListPage extends StatefulWidget {
  @override
  _NearbyListPageState createState() => _NearbyListPageState();
}

class _NearbyListPageState extends State<NearbyListPage> with AutomaticKeepAliveClientMixin<NearbyListPage> {

  @override
  bool get wantKeepAlive => true;

  NearModel testData = NearModel(
    avatar:
        'https://img2.woyaogexing.com/2020/02/14/9d7498cadd2c4823a44df61a509dedad!400x400.jpeg',
    name: '不晓得',
    desc: '这个妹子很漂亮哟~',
    distance: 1,
    sex: 0,
  );

  EasyRefreshController _controller;

  List<NearModel> dynamicList = [];

  // 是否已全部加载
  bool _enableControlFinish = false;

  /// 下拉刷新数据
  Future<Null> _refreshData() async {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        _getPostData(false);
        if (!_enableControlFinish) {
          _controller.resetLoadState();
          _controller.finishRefresh();
        }
      }
    });
  }

  /// 上拉加载数据
  Future<Null> _addMoreData() async {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        _getPostData(true);
        if (!_enableControlFinish) {
          _controller.finishLoad(noMore: dynamicList.length >= 20);
        }
      }
    });
  }

  /// 获取数据
  void _getPostData(bool _beAdd) async {
    setState(() {
      if (!_beAdd) {
        dynamicList.clear();
        dynamicList = [testData, testData, testData, testData, testData, testData];
      } else {
        dynamicList.addAll([testData, testData, testData, testData, testData]);
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    dynamicList.addAll([testData, testData, testData, testData, testData]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: '附近人'),
      body: EasyRefresh(
        taskIndependence: true,
        enableControlFinishLoad: true,
        header: MaterialHeader(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Color(0xFFff7faa)),
        ),
        footer: MaterialFooter(
          backgroundColor: Colors.white,
          enableInfiniteLoad: true,
          valueColor: AlwaysStoppedAnimation(Color(0xFFff7faa)),
        ),
        controller: _controller,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 8),
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(IconFont.icon_dingwei,
                        size: 20, color: Color(0xFFff7faa)),
                    Gaps.hGap4,
                    Text(
                      '闵行区沪闵路6088号莘庄龙之梦',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333)),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView.separated(
                  itemCount: dynamicList.length > 0 ? dynamicList.length : 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return NearItemWidget(data: dynamicList[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      new Divider(),
                ),
              )
            ],
          ),
        ),
        onRefresh: _refreshData,
        onLoad: _addMoreData,
      ),
    );
  }
}
