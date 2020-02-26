import 'package:flutter/material.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';
import 'package:flutter_talk/widget/load_image.dart';

class TopicItemWidget extends StatelessWidget {
  final ListTopicModel data;
  final Function onTap;
  const TopicItemWidget({Key key, @required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '# ${data.tag}',
                          style: const TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          data.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  AvatarWidget(
                                    data.avatar,
                                    width: 24,
                                    height: 24,
                                  ),
                                  Gaps.hGap8,
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '阅读: ${data.number}',
                                style: const TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 140,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: LoadImage(data.image),
                    )),
              ],
            ),
          ),
          Gaps.vGap15,
        ],
      ),
    );
  }
}

class ListTopicModel {
  /// 头像
  final String avatar;
  // 描述
  final String name;
  // 描述
  final String desc;

  final String content;

  final String image;

  final String tag;

  final int number;

  const ListTopicModel(
      {this.avatar,
      this.name,
      this.desc,
      this.content,
      this.image,
      this.tag,
      this.number});
}
