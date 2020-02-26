import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/widget/app_bar.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';

class TopicDetailPage extends StatefulWidget {
  @override
  _TopicDetailPageState createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage>
    with
        AutomaticKeepAliveClientMixin<TopicDetailPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

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
    content: '都说了我胖虎不简单了~',
    image: [
      'http://5b0988e595225.cdn.sohucs.com/images/20190816/19bf6a37d2b547679d78e23c62581021.jpeg',
    ],
    tag: '新人得那些事',
  );

  List<DynamicModel> dynamicList = [];

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
          _controller.finishLoad(noMore: dynamicList.length >= 3);
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
        dynamicList.add(testData);
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
    dynamicList.add(testData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: '新人的那些事情',
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: EasyRefresh(
            taskIndependence: true,
            enableControlFinishLoad: true,
            header: MaterialHeader(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Color(0xFFff7faa)),
            ),
            footer: MaterialFooter(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Color(0xFFff7faa)),
            ),
            controller: _controller,
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: double.infinity - 30,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: LoadImage(
                              'https://fzn.cc/wp-content/uploads/2018/01/274755aeb65a36513fe7dd5c80715c53.gif',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Gaps.vGap10,
                      Text(
                        '在这里你可以畅谈双子座的一些琐事~',
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 14),
                      ),
                      Gaps.vGap4,
                      Text(
                        '来话题#新人的那些事情#发布动态，说出你的囧事~',
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Gaps.vGap15,
                ListView.builder(
                    itemCount: dynamicList.length > 0 ? dynamicList.length : 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return DynamicItemWidget(data: dynamicList[index]);
                    })
              ],
            ),
            onRefresh: _refreshData,
            onLoad: _addMoreData,
          ),
        ));

//
  }
}
