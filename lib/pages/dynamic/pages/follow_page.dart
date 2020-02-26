import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage>
    with
        AutomaticKeepAliveClientMixin<FollowPage>,
        SingleTickerProviderStateMixin {
  EasyRefreshController _controller;
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
  List<DynamicModel> _dynamicList = [];

  @override
  bool get wantKeepAlive => true;

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
          _controller.finishLoad(noMore: _dynamicList.length >= 3);
        }
      }
    });
  }

  /// 获取数据
  void _getPostData(bool _beAdd) async {
    setState(() {
      if (!_beAdd) {
        _dynamicList.clear();
        _dynamicList = [testData];
      } else {
        _dynamicList.add(testData);
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
    _dynamicList.add(testData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TalkAppListView(
      controller: _controller,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
            itemCount: _dynamicList.length > 0 ? _dynamicList.length : 0,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return DynamicItemWidget(data: _dynamicList[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                new Divider(),
          )),
      onRefresh: _refreshData,
      onloadMore: _addMoreData,
    ));
  }
}
