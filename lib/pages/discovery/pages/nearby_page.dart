import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_talk/pages/discovery/discovery_router.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/cell.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage>
    with
        AutomaticKeepAliveClientMixin<NearbyPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  EasyRefreshController _controller;
  // 是否已全部加载
  bool _enableControlFinish = false;


  NearModel testData2 = NearModel(
    avatar:
    'https://img2.woyaogexing.com/2020/02/14/9d7498cadd2c4823a44df61a509dedad!400x400.jpeg',
    name: '不晓得',
    desc: '这个妹子很漂亮哟~',
    distance: 1,
    sex: 0,
  );

  DynamicModel testData = DynamicModel(
      userInfo: UserModel(
        name: '木木哒',
        slign: '我拉个晓得撒~',
        avatar:
        'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
      ),
      content: '╬═☆丕傠ぬ丕迎匼，丕夠傠囍狚炔洎怞ルo',
      image: [
        'http://5b0988e595225.cdn.sohucs.com/images/20190816/19bf6a37d2b547679d78e23c62581021.jpeg',
      ],
      tag: '新人得那些事',
      avatars: [
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/07/c9a000fd3b304438bc6380f7756ffbdc!400x400.jpeg'),
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/07/1383eb96c5d14c03befa008cff870752!400x400.jpeg'),
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/14/04199d221cfb445bbb400999dbc3e248!400x400.jpeg'),
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/14/3d352b92e7df409bb2dd172d0b73ad4f!400x400.jpeg'),
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/14/9d7498cadd2c4823a44df61a509dedad!400x400.jpeg'),
        AvatarList(
            avatar:
                'https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg')
      ]);

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
        ]);
      }
    });
  }

  @override
  void initState() {
    _controller = EasyRefreshController();
    dynamicList.addAll([testData]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: TalkAppListView(
        controller: _controller,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
              margin: EdgeInsets.only(top: 15,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfff5f5f5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
            Gaps.vGap15,
            Cell(
              title: '为你推荐附近人',
              desc: '有缘数里来相会',
              onTap: () {
                NavigatorUtils.push(context,DiscoveryRouter.nearListPage);
              },
            ),
            Gaps.vGap15,
            Row(
              children: <Widget>[
                _NearItemWidget(testData2),
                Gaps.hGap15,
                _NearItemWidget(testData2),
              ],
            ),
            Gaps.vGap15,
            Cell(
              title: '为你推荐的动态',
              desc: '小哥哥们快来玩呀',
            ),
            Container(
              child: ListView.separated(
                  itemCount: dynamicList.length > 0 ? dynamicList.length : 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return DynamicItemWidget(
                      index: index,
                      data: dynamicList[index],
                      onTapImage: () {},
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => new Divider(),
                  ),
            )
          ],
        )),
        onRefresh: _refreshData,
        onloadMore: _addMoreData,
      ),
    ));
  }


  Widget _NearItemWidget (NearModel data) {
    return Container(
      width: 140,
      padding: EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xFFFFF3F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AvatarWidget(data.avatar, width: 40, height: 40,),
          Gaps.vGap8,
          Text(
            data.name,
            style: TextStyle(
                color: Color(0xff333333),
                fontSize: 16,
                fontWeight: FontWeight.w800),
          ),
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('90后', style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontWeight: FontWeight.w800)),
              Gaps.hGap8,
              data.sex == 1 ? Container(
                padding: EdgeInsets.only(
                    top: 2, left: 4, right: 4, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(12)
                  ),
                  color: Colors.blue[300],
                ),
                child: Text(
                  '♂',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ) : Container(
                padding: EdgeInsets.only(
                    top: 2, left: 4, right: 4, bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(12),
                  ),
                  color: Color(0xFFff7faa),
                ),
                child: Text(
                  '♀',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),


            ],
          ),
          Gaps.vGap10,
          Text(
            '距离${data.distance}km',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}


class NearModel {
  final String avatar;
  final String name;
  final String desc;
  final int sex;
  final int distance;

  const NearModel({this.name, this.avatar, this.desc, this.sex, this.distance});
}
