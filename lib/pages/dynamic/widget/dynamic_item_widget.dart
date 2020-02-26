import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/discovery/discovery_router.dart';
import 'package:flutter_talk/pages/discovery/widget/topic_item.dart';
import 'package:flutter_talk/pages/dynamic/dynamics_router.dart';
import 'package:flutter_talk/pages/user/pages/user_page.dart';
import 'package:flutter_talk/pages/user/users_router.dart';
import 'package:flutter_talk/routers/fluro_navigator.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';

import 'dynamic_item_image.dart';

class DynamicItemWidget extends StatelessWidget {
  final DynamicModel data;
  final int index;
  final Function onTapImage;
  final Function onTapItem;

  const DynamicItemWidget(
      {Key key, this.data, this.index, this.onTapItem, this.onTapImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _renderCover(context),
            Gaps.vGap15,
            DynamicItemImage(image: data.image, onTap: onTapImage),
            Gaps.vGap15,
            GestureDetector(
                onTap: () {
                  NavigatorUtils.push(
                      context, DynamicsRouter.dynamicDetailPage);
                },
                child: Container(
                  child: Text(
                    data.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                  ),
                )),
            Gaps.vGap15,
            _renderDynamiTagAndComment(context),
          ],
        ));
  }

  // 用户头像信息
  Widget _renderCover(context) {
    return GestureDetector(
        onTap: () {
          NavigatorUtils.push(context, UsersRouter.userPage);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AvatarWidget(
                  data.userInfo.avatar,
                  width: 40,
                  height: 40,
                ),
                Gaps.hGap8,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.userInfo.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                    ),
                    Text(
                      data.userInfo.slign,
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
        ));
  }

  // 动态
  Widget _renderDynamiTagAndComment(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            TopicItem('搞事情~', onTap: () {
              NavigatorUtils.push(context, DiscoveryRouter.topicDetailPage);
            })
          ],
        ),
        Gaps.vGap15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              IconFont.icon_fabu,
              size: 20,
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
}

class DynamicModel {
  final UserModel userInfo;
  final String content;

  final List<String> image;

  final String tag;

  final List<AvatarList> avatars;

  const DynamicModel(
      {this.avatars, this.userInfo, this.content, this.image, this.tag});
}

class AvatarList {
  final String avatar;
  const AvatarList({this.avatar});
}
