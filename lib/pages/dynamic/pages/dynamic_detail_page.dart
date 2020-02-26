import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_image.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/app_bar.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';

import '../dynamics_router.dart';

class DynamicDetailPage extends StatelessWidget {

  List<String> data = [
    'https://img2.woyaogexing.com/2020/02/24/7d8680e03a3d46d1a84182dce9a77a33!400x400.jpeg',
    'https://img2.woyaogexing.com/2020/02/24/7d8680e03a3d46d1a84182dce9a77a33!400x400.jpeg',
    'https://img2.woyaogexing.com/2020/02/24/7d8680e03a3d46d1a84182dce9a77a33!400x400.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: '动态',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Gaps.vGap15,
                _renderCover(context),
                Gaps.vGap15,
                DynamicItemImage(image: data, onTap: () {
                  NavigatorUtils.push(context, DynamicsRouter.photoViewGalleryScreen);
                },),
                Gaps.vGap15,
                Text(
                  '花半开最美，情留白最浓，懂得给生命留\n白，亦是一种生活的智慧。淡泊以明志，\n'
                  '宁静以致远，懂得给心灵留白，方能在纷杂繁琐的世界，淡看得失，宠辱不惊，去意'
                  '无留；懂得给感情留白，方能持久生香，\n留有余地，相互欣赏，拥有默契;',
                  softWrap: true,
                  maxLines: null,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                Gaps.vGap15,
                _renderDynamiTagAndComment(context),
                Gaps.vGap15,
                Text('评论(4)', style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff999999)
                ),),
                Gaps.vGap15,
                _renderCommonItem(),
                _renderCommonItem(),
                _renderCommonItem(),
              ],
            ),
          ),
        ));
  }
  Widget _renderDynamiTagAndComment(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFff7faa),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 20.0,
                  alignment: Alignment.center,
                  child: Text(
                    '# 话题',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ))
          ],
        ),
        Gaps.vGap15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              IconFont.icon_fabu,
              size: 20,
              color: Color(0xFF999999),
            ),
            Row(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconFont.icon_guanzhu,
                      size: 20,
                    ),
                    Gaps.hGap8,
                    Text(
                      '32',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
                Gaps.hGap12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconFont.icon_liaotian,
                      size: 20,
                    ),
                    Gaps.hGap8,
                    Text(
                      '38',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Gaps.vGap8,
      ],
    );
  }

  Widget _renderCommonItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AvatarWidget('https://img2.woyaogexing.com/2020/02/24/7d8680e03a3d46d1a84182dce9a77a33!400x400.jpeg', width: 34, height: 34,),
        Gaps.hGap10,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '奇磨叽',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFff7faa),
                      ),
                    ),
                    Gaps.vGap4,
                    Text(
                      '12分钟',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
                Text('+ 关注',
                    style: TextStyle(color: Color(0xFFff7faa), fontSize: 14)),
              ],
            ),
            Gaps.vGap10,
            Text(
              '非常喜欢一句话, 幸福是可以存储的❤',
              softWrap: true,
              maxLines: null,
              style: TextStyle(fontSize: 16.0, color: Color(0xff333333)),
            ),
            Gaps.vGap10,
            Icon(
              IconFont.icon_guanzhu,
              size: 20,
              color: Color(0xFFff7faa),
            ),
            Gaps.vGap10,
            Divider(),
          ],
        ))
      ],
    );
  }

  Widget _renderCover(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AvatarWidget( 'https://img2.woyaogexing.com/2020/02/24/7d8680e03a3d46d1a84182dce9a77a33!400x400.jpeg', width: 40, height: 40,),
            Gaps.hGap8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '奇磨叽',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                ),
                Text(
                  'null',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),


              ],
            ),
          ],
        ),
        Container(
            child: FlatButton(
              child: Text(
                '关注',
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
    );
  }
}
