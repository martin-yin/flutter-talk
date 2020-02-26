import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class DynamicSelfiePage extends StatefulWidget {
  @override
  _DynamicSelfiePage createState() => _DynamicSelfiePage();
}

class _DynamicSelfiePage extends State<DynamicSelfiePage>
    with
        AutomaticKeepAliveClientMixin<DynamicSelfiePage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  EasyRefreshController _controller;

  // 是否已全部加载
  bool _enableControlFinish = false;

  DynamicModel testData = DynamicModel(
    userInfo: UserModel(
      name: '胖虎',
      age: 22,
      sex: 1,
      dynamic: 1,
      lovenumber: 0,
      footprint: 0,
      fans: 9999,
      imagelist: [
        'http://wx2.sinaimg.cn/large/006GJQvhly1fzisd44hmjj30g40fxglz.jpg',
        'http://wx1.sinaimg.cn/large/a6d0124fly1fmvjldxon7j204w057js6.jpg'
      ],
      taglist: [
        '大熊杀手',
      ],
      slign: '我胖虎今天就是要搞事情~',
      avatar:
          'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
    ),
    content: '我胖虎今天就是要搞事情',
    image: [
      'http://wx1.sinaimg.cn/large/a6d0124fly1fmvjldxon7j204w057js6.jpg',
    ],
    tag: '日常吹逼',
  );

  List<DynamicModel> dynamicList = [];

  /// 下拉刷新数据
  Future<Null> _refreshData() async {
    Future.delayed(Duration(seconds: 1), () {
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
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        _getPostData(true);
        if (!_enableControlFinish) {
          _controller.finishLoad(noMore: dynamicList.length >= 80);
        }
      }
    });
  }

  /// 获取数据
  void _getPostData(bool _beAdd) async {
    setState(() {
      if (!_beAdd) {
        dynamicList.clear();
        dynamicList = [testData];
      } else {
        dynamicList.addAll([
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData,
          testData
        ]);
      }
    });
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    dynamicList.addAll(
        [testData, testData, testData, testData, testData, testData, testData]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            margin: EdgeInsets.only(top: 10),
            child: TalkAppListView(
              child: StaggeredGridView.countBuilder(
                itemCount: dynamicList.length > 0 ? dynamicList.length : 0,
                primary: false,
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) =>
                    buildGestureDetector(dynamicList[index]),
                staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
              ),
              controller: _controller,
              onRefresh: _refreshData,
              onloadMore: _addMoreData,
            )));
  }

  GestureDetector buildGestureDetector(DynamicModel data) {
    return GestureDetector(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: LoadImage(data.userInfo.avatar),
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "春蚕死去了，但留下了华贵丝绸；蝴蝶死去了，但留下了漂亮的衣裳；画眉飞去了，但留下了美妙的歌声；花朵凋谢了，但留下了缕缕幽香；蜡烛燃尽了，但留下一片光明；雷雨过去了，但留下了七彩霓虹",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                ),
                Gaps.vGap10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AvatarWidget('https://img2.woyaogexing.com/2020/02/07/a0b239f0e803449686bd0f8358c9b3dc!400x400.jpeg', width: 24, height: 24,),
                        Gaps.hGap10,
                        Text(
                          'no name',
                          style:
                              TextStyle(color: Color(0xFF999999), fontSize: 14),
                        ),
                      ],
                    ),
                    Icon(
                      IconFont.icon_guanzhu,
                      size: 20,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
