import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_talk/pages/dynamic/pages/dynamic_page.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 2);
  }

  _onPageChange(int index) async {
    setState(() {
      tabstate = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 360,
                  child: LoadImage(userInfo.bgImage),
                ),
                Container(
                  height: 360,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
                Align(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                AvatarWidget(
                                  'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
                                  width: 70,
                                  height: 70,
                                ),
                                Container(
                                    child: FlatButton(
                                      child: Text(
                                        '编辑',
                                        style: TextStyle(
                                          fontFamily: 'PingFang-SC-Medium',
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
                                  fontFamily: 'PingFang-SC-Medium',
                                  fontWeight: FontWeight.w800),
                            ),
                            Gaps.vGap8,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      top: 2, left: 4, right: 4, bottom: 2),
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
                                      fontFamily: 'PingFang-SC-Medium',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${userInfo.dynamic}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'PingFang-SC-Medium',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${userInfo.lovenumber}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'PingFang-SC-Medium',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${userInfo.footprint}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'PingFang-SC-Medium',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${userInfo.fans}k',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'PingFang-SC-Medium',
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
                      Container(
                          width: double.infinity,
                          height: 50,
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TabBar(
                                labelColor: Color(0xffFF7E98),
                                indicatorColor: Color(0xffFF7E98),
                                tabs: <Widget>[
                                  Tab(text: "资料"),
                                  Tab(text: "动态"),
                                ],
                                controller: _tabController,
                                indicatorWeight: 3,
                                indicatorPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                isScrollable: true,
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffFF7E98),
                                  fontFamily: 'PingFang-SC-Medium',
                                  fontWeight: FontWeight.w800,
                                ),
                                unselectedLabelColor: Color(0xff999999),
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 14, color: Color(0xff999999)),
                                indicatorSize: TabBarIndicatorSize.label,
                                onTap: (index) {
                                  _onPageChange(index);
                                },
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Gaps.vGap15,
            tabstate == 0
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  ImageItem(item)
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
                                for (String item in userInfo.taglist)
                                  TagItem(item),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '22',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'PingFang-SC-Medium',
                                            color: Color(0xff333333)),
                                      ),
                                      Gaps.vGap4,
                                      Text(
                                        '2020.2',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'PingFang-SC-Medium',
                                            color: Color(0xff999999)),
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
                                              ),
                                              child: LoadImage(
                                                'https://pic4.zhimg.com/80/v2-a1692d6717a7c22fb277a6a1e4443a98_hd.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Gaps.vGap12,
                                            Text(
                                              '为何靓仔总是那么得孤独~',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      'PingFang-SC-Medium',
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
                        itemCount: 2),
                  ),
          ],
        ),
      ),
    ));
  }
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
        style: TextStyle(
            fontSize: 12,
            color: Color(0xFF666666)),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: LoadImage(imageUrl, width: 80, height: 80, fit: BoxFit.cover,),
      )
    );

  }
}
