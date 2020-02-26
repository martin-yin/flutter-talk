import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/pages/discovery/widget/accompany_item_widget.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class AccompanyPage extends StatefulWidget {
  @override
  _AccompanyPageState createState() => _AccompanyPageState();
}

class _AccompanyPageState extends State<AccompanyPage>  with AutomaticKeepAliveClientMixin<AccompanyPage> {

  EasyRefreshController _controller;
  // 是否已全部加载
  bool _enableControlFinish = false;

  AccommpanyModel testData = AccommpanyModel(
      avatar:
      'https://img2.woyaogexing.com/2020/02/21/fd4b9708ac6f4d4db85821a2070301db!400x400.jpeg',
      name: '木木哒',
      time: '我拉个晓得撒~',
      area: '1km',
      acctime: '╬═☆丕傠ぬ丕迎匼，丕',
      title: '压马路',
      image: 'https://img2.woyaogexing.com/2020/02/21/d2775a2125314ffab36552a6111ab3a9!400x400.jpeg',
  );
  List<AccommpanyModel> accompanyList = [];

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
          _controller.finishLoad(noMore: accompanyList.length >= 80);
        }
      }
    });
  }

  /// 获取数据
  void _getPostData(bool _beAdd) async {
    setState(() {
      if (!_beAdd) {
        accompanyList.clear();
        accompanyList = [testData];
      } else {
        accompanyList.addAll([
          testData,
        ]);
      }
    });
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    accompanyList.addAll([testData, testData]);
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
                itemCount: accompanyList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AccompanyItemWidget(data: accompanyList[0]);
                }
            ),
            onRefresh: _refreshData,
            onloadMore: _addMoreData,
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
