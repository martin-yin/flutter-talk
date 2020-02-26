import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_talk/pages/discovery/discovery_router.dart';
import 'package:flutter_talk/pages/discovery/widget/topic_item.dart';
import 'package:flutter_talk/pages/dynamic/widget/topic_item_widget.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/widget/cell.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/talk_app_list_view.dart';

class TopicPage extends StatefulWidget {
  @override
  _TopicPageState createState() => _TopicPageState();
}

const List<ListTopicModel> newsList = [
  ListTopicModel(
    avatar:
        'https://img2.woyaogexing.com/2020/02/07/d48e4cec2ffd4afdb3b79f5905c0fce4!400x400.jpeg',
    name: '我给自己带盐',
    desc: '这个人很懒啥都没写~',
    content:
        '春蚕死去了，但留下了华贵丝绸；蝴蝶死去了，但留下了漂亮的衣裳；画眉飞去了，但留下了美妙的歌声；花朵凋谢了，但留下了缕缕幽香；蜡烛燃尽了，但留下一片光明；雷雨过去了，但留下了七彩霓虹',
    image:
        'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/65/w1000h665/20200214/739e-ipmxpvz8262419.jpg',
    tag: '我们这群90后~',
    number: 100,
  ),
  ListTopicModel(
    avatar:
        'https://img2.woyaogexing.com/2020/02/07/a0b239f0e803449686bd0f8358c9b3dc!400x400.jpeg',
    name: '子子',
    desc: '这个人很懒啥都没写~',
    content:
        '欲将沉醉换悲凉，清歌莫断肠。这混乱的尘世，究竟充斥了多少绝望和悲伤。你想去做一个勇敢的男子，为爱，为信仰，轰轰烈烈的奋斗一场。你周身充斥着无人可比的灵气和光芒。你有着与伟人比肩的才气和名声，你是那样高傲孤洁的男子。你的一寸狂心未说，已经几度黄昏雨',
    image:
        'http://n.sinaimg.cn/news/1_img/upload/cf3881ab/110/w1000h710/20200214/d3a7-ipmxpvz8262445.jpg',
    tag: '小心思~',
    number: 100,
  )
];

class _TopicPageState extends State<TopicPage>
    with
        AutomaticKeepAliveClientMixin<TopicPage>,
        SingleTickerProviderStateMixin {
  EasyRefreshController _controller;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TalkAppListView(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            HotTopicWidget(),
            Gaps.vGap15,
            Cell(title: '热门话题', desc: '发现你喜欢的话题', onTap: () {
            },),
            Gaps.vGap10,
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TopicItem('你的小心想', onTap: () {
                    NavigatorUtils.push(context, DiscoveryRouter.topicDetailPage);
                  },),
                  Gaps.hGap10,
                  TopicItem('你的小心想'),
                ],
              ),
            ),
            Gaps.vGap15,
            Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: newsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return TopicItemWidget(data: newsList[index],);
                  }),
            )
          ],
        ),
      ),
      controller: _controller,
      onRefresh: () {},
      onloadMore: () {},
    ));
  }

  Widget HotTopicWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 185,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffff2a7c),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20,
                  left: 16,
                  child: Text(
                    '今日最热',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: Container(
                    width: 98,
                    child: Text(
                      '双子座的那些小事情',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 90,
                  child: Image.asset(
                    'assets/images/szz.png',
                    width: 92,
                    height: 80,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 185,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 175,
                  height: 84,
                  decoration: BoxDecoration(
                      color: Color(0xFFff7faa),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(''),
                ),
                Container(
                  width: 175,
                  height: 84,
                  decoration: BoxDecoration(
                      color: Color(0xFFff7faa),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(''),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
