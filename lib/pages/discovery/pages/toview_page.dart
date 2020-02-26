import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class ToviewPage extends StatefulWidget {
  @override
  _ToviewPageState createState() => _ToviewPageState();
}

class _ToviewPageState extends State<ToviewPage>
    with
        AutomaticKeepAliveClientMixin<ToviewPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  EasyRefreshController _controller;
  // 是否已全部加载
  bool _enableControlFinish = false;

  TopviewModel testData = TopviewModel(
    avatar:
        'https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg',
    name: '木木哒',
    title: '有哪些牛逼逼红红但是却不为人知的事情~~',
    time: 2,
    count: 999,
    cover: 'https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg',
  );

  TopviewModel testData2 = TopviewModel(
    avatar:
    'https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg',
    name: '木木哒',
    title: '有哪些牛逼逼红红但是却不为人知的事情~~',
    time: 2,
    count: 666,
    cover: '',
  );

  List<TopviewModel> topviewList = [];

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
          _controller.finishLoad(noMore: topviewList.length >= 80);
        }
      }
    });
  }

  /// 获取数据
  void _getPostData(bool _beAdd) async {
    setState(() {
      if (!_beAdd) {
        topviewList.clear();
        topviewList = [testData];
      } else {
        topviewList.addAll([
          testData,
        ]);
      }
    });
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    topviewList.addAll([testData, testData2]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TalkAppListView(
            controller: _controller,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => new Divider(),
                itemCount: topviewList.length > 0 ? topviewList.length : 0,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ToviewItemidget(data: topviewList[index]);
                }),
            onRefresh: _refreshData,
            onloadMore: _addMoreData,
          ),
        ));
  }
}

class ToviewItemidget extends StatelessWidget {
  final TopviewModel data;
  const ToviewItemidget({Key key, this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
            child: Text(
              '${data.count}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Gaps.hGap8,
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      data.cover != '' ?  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: LoadImage(data.cover, width: 40, height: 40,),
                      ) : SizedBox(),
                    ],
                  ),
                  Gaps.vGap4,
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AvatarWidget(data.avatar, width: 24, height: 24,),
                            Gaps.hGap12,
                            Text(
                              data.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF999999),
                              ),
                            )
                          ],
                        ),
                        Text(
                          '${data.time}分钟前',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopviewModel {
  final String avatar;
  final String name;
  final String title;
  final int count;
  final int time;
  final String cover;

  const TopviewModel(
      {this.name, this.avatar, this.title, this.count, this.time, this.cover});
}
