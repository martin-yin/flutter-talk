import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_page.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with
        AutomaticKeepAliveClientMixin<UserPage>,
        SingleTickerProviderStateMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  TabController _tabController;

  int tabstate = 0;

  UserModel userInfo = UserModel(
    name: '胖虎',
    age: 22,
    sex: 1,
    dynamic: 1,
    lovenumber: 0,
    footprint: 0,
    fans: 9999,
    bgImage:
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2079142283,260416917&fm=15&gp=0.jpg',
    imagelist: [
      'http://wx2.sinaimg.cn/large/006GJQvhly1fzisd44hmjj30g40fxglz.jpg',
      'http://wx1.sinaimg.cn/large/a6d0124fly1fmvjldxon7j204w057js6.jpg'
    ],
    taglist: ['大熊杀手', '灵魂歌手', 'deep dark fantasy ♂'],
    slign: '我胖虎今天就是要搞事情~',
    avatar:
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2079142283,260416917&fm=15&gp=0.jpg',
  );

  ScrollController _scrollViewController;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);

    _scrollViewController.addListener(() => {
          if (_scrollViewController.offset > 230)
            {
              setState(() {
                show = true;
              })
            }
          else
            {
              setState(() {
                show = false;
              })
            }
        });
    _tabController = TabController(initialIndex: 0, vsync: this, length: 2);
  }

  _onPageChange(int index) async {
    setState(() {
      tabstate = index;
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Widget UserPageHeader() {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/ic_back_black.png',
            color: Color(0xff999999),
            width: 24,
          ),
//          Container(
//            child: Text(
//              '摸鱼王摸鱼了么',
//              style: TextStyle(color: Color(0xff333333), fontSize: 16),
//            ),
//          ),

          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color(0xFFff7faa),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: <Widget>[
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(60, 170, 250, 0.2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
                      ),
                    ),
                  ),
                ),

                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  '关注',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: Color(0xff999999)),
                Gaps.hGap12,
                Icon(Icons.more_vert, color: Color(0xff999999)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: show == false ? SizedBox() : UserPageHeader(),
              centerTitle: false,
              pinned: true,
              floating: false,
              snap: false,
              primary: true,
              expandedHeight: 340.0,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  height: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          height: 340,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2079142283,260416917&fm=15&gp=0.jpg',
                                  )))),
                      Container(
                        height: 340,
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                      ),
                      Align(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.only(top: 40, left: 20, right: 20),
                              width: double.infinity,
                              height: 340,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.settings,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                  Gaps.vGap15,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(60, 170, 250, 0.2),
                                          shape: BoxShape.circle,
                                          border: new Border.all(
                                              width: 2.0, color: Colors.white),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: FlatButton(
                                            child: Text(
                                              '编辑',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          height: 28,
                                          width: 58,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFff7faa),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(18),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Gaps.vGap15,
                                  Text(
                                    userInfo.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Gaps.vGap8,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${userInfo.age}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800)),
                                      Gaps.hGap8,
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 2,
                                            left: 4,
                                            right: 4,
                                            bottom: 2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topLeft: Radius.circular(12),
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
                                      ),
                                    ],
                                  ),
                                  Gaps.vGap8,
                                  Text(
                                    userInfo.slign,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Gaps.vGap15,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${userInfo.dynamic}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                          Gaps.vGap8,
                                          Text(
                                            '动态',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xfff5f5f5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${userInfo.lovenumber}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                          Gaps.vGap8,
                                          Text(
                                            '赞',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xfff5f5f5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${userInfo.footprint}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                          Gaps.vGap8,
                                          Text(
                                            '足迹',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xfff5f5f5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${userInfo.fans}k',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                          Gaps.vGap8,
                                          Text(
                                            '粉丝',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xfff5f5f5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: UserTab(
                tabController: _tabController,
              ),
            ),
          ];
        },
        body: tabstate == 1
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.image,
                              size: 20,
                              color: Color(0xffFF7E98),
                            ),
                            Gaps.hGap8,
                            Text(
                              '照片',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff333333)),
                            )
                          ],
                        ),
                        Gaps.vGap8,
                        Row(
                          children: <Widget>[
                            for (String item in userInfo.imagelist)
                              ImageItem(item),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.whatshot,
                              size: 20,
                              color: Colors.purple,
                            ),
                            Gaps.hGap8,
                            Text(
                              '兴趣爱好',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff333333)),
                            )
                          ],
                        ),
                        Gaps.vGap8,
                        Wrap(
                          spacing: 10,
                          runSpacing: 8,
                          children: <Widget>[
                            for (String item in userInfo.taglist) TagItem(item),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 15),
                color: Colors.white,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 0),
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '22',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff333333)),
                                  ),
                                  Gaps.vGap4,
                                  Text(
                                    '2020.2',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff999999)),
                                  ),
                                ],
                              ),
                              Gaps.hGap15,
                              Expanded(
                                  child: CustomPaint(
                                painter: MyPainterLeft(Color(0xffDBDBDB)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 15),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F5F5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 240,
                                          height: 240,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            color: Color.fromRGBO(
                                                60, 170, 250, 0.2),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Gaps.vGap12,
                                        Text(
                                          '为何靓仔总是那么得孤独~',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff333333)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ));
                    },
                    itemCount: 4),
              ),
      ),
    );
  }
}

class UserTab extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const UserTab({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1, //宽度
            color: Color(0xffF5F5F5), //边框颜色
          ),
        ),
      ),
      child: TabBar(
        labelColor: Color(0xffFF7E98),
        indicatorColor: Color(0xffFF7E98),
        tabs: <Widget>[
          Tab(text: "资料"),
          Tab(text: "动态"),
        ],
        controller: tabController,
        indicatorWeight: 3,
        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        isScrollable: true,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xffFF7E98),
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelColor: Color(0xff999999),
        unselectedLabelStyle: TextStyle(fontSize: 14, color: Color(0xff999999)),
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (index) {},
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

class UserModel {
  final String bgImage;
  final String avatar;
  final String name;
  final int age;
  // 0 女 1男
  final int sex;
  final String slign;
  final int dynamic;
  final int lovenumber;
  final int footprint;
  final int fans;
  final List<String> imagelist;
  final List<String> taglist;
  const UserModel({
    this.bgImage,
    this.avatar,
    this.name,
    this.age,
    this.sex,
    this.slign,
    this.dynamic,
    this.lovenumber,
    this.footprint,
    this.fans,
    this.imagelist,
    this.taglist,
  });
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imageUrl;

  ImageItem(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Color.fromRGBO(60, 170, 250, 0.2),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        this.coverImgUrl,
                      )))),
          Container(
            height: 360,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),

//

          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LoadImage(
                  'https://img1.gamersky.com/image2019/07/20190725_ll_red_136_2/gamersky_07small_14_201972510258D0.jpg',
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '哪吒之魔童降世',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    '动画/中国大陆/110分钟',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    '2019-07-26 08:00 中国大陆上映',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    '32.1万人想看/大V推荐度95%',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '剧情简介',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                '天地灵气孕育出一和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
