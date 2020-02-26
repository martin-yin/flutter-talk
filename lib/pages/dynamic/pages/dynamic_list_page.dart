import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_talk/pages/dynamic/dynamics_router.dart';
import 'package:flutter_talk/pages/dynamic/provider/dynamic_page_provider.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_talk/pages/provider/home_provider.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/provider/common_provider.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/widget/load_image.dart';
import 'package:flutter_talk/widget/nomore_widget.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';
import 'package:provider/provider.dart';

class DynamicListPage extends StatefulWidget {
  final int index;

  const DynamicListPage({Key key, this.index}) : super(key: key);

  @override
  _DynamicListPageState createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage>
    with
        AutomaticKeepAliveClientMixin<DynamicListPage>,
        SingleTickerProviderStateMixin {
  DynamicPageProvider provider = DynamicPageProvider();

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
  bool get wantKeepAlive => true;

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
    return ChangeNotifierProvider<DynamicPageProvider>(
        create: (_) => provider,
        child: Consumer<DynamicPageProvider>(builder: (_, provider, __) {
          return Scaffold(
              body: TalkAppListView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                blurRadius: 1,
                                spreadRadius: 1),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Swiper(
                              itemBuilder: _swiperBuilder,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              autoplay: true,
                              onTap: (index) => print('点击了第$index个'),
                            ))),
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                          itemCount:
                              dynamicList.length > 0 ? dynamicList.length : 0,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: new NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return DynamicItemWidget(
                              index: index,
                              data: dynamicList[index],
                              onTapImage: () {
                                Provider.of<CommonProvider>(context,
                                        listen: false)
                                    .setDynamicImageList(
                                        dynamicList[index].image);
                                NavigatorUtils.push(context,
                                    DynamicsRouter.photoViewGalleryScreen);
                              },
                            );
                          }),
                    )
                  ],
                )),
            controller: _controller,
            onRefresh: _refreshData,
            onloadMore: _addMoreData,
          ));
        }));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: LoadImage("index_banner", fit: BoxFit.cover,),
      );
  }
}
