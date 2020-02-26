import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_item_widget.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';
import 'package:like_button/like_button.dart';

class AccompanyItemWidget extends StatelessWidget {
  final AccommpanyModel data;
  final int index;
  final Function onTapImage;
  final Function onTapItem;

  const AccompanyItemWidget(
      {Key key, this.data, this.index, this.onTapItem, this.onTapImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 6, bottom: 8),
        child: Column(
          children: <Widget>[_renderCover(context), Gaps.vGap15, _renderInfo()],
        ));
  }

  // 用户头像信息
  Widget _renderCover(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AvatarWidget(data.avatar, width: 40, height: 40,),
        Gaps.hGap10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data.name,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF333333),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
            ),
            Text(
              data.time,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _renderInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            width: 90,
            height: 90,
            margin: EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LoadImage(
                data.image,
                fit: BoxFit.cover,
              ),
            )),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff333333),
                    ),
                  ),
                  Gaps.vGap8,
                  Text(
                    data.acctime,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                  ),
                  Gaps.vGap4,
                  Text(
                    data.area,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                  ),
                  Gaps.vGap4,
                  Text(
                    '米秀兰KTV',
                    style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                  ),
                ],
              ),
              Container(
                  child: FlatButton(
                    child: Text(
                      '约伴',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
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
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class AccommpanyModel {
  final String avatar;

  final String name;

  final String time;

  final String title;

  final String acctime;
  final String area;
  final String image;

  AccommpanyModel(
      {this.title,
      this.avatar,
      this.name,
      this.time,
      this.acctime,
      this.area,
      this.image});
}
