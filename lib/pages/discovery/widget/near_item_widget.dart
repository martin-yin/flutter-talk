import 'package:flutter/material.dart';
import 'package:flutter_talk/pages/discovery/pages/nearby_page.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';

class NearItemWidget extends StatelessWidget {
  final NearModel data;
  const NearItemWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AvatarWidget('https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg', width: 40, height: 40,),
                      Gaps.hGap10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                data.name,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF333333)),
                              ),
                              Gaps.hGap8,
                              Container(
                                  padding: EdgeInsets.all(4),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 2, left: 2, right: 4, bottom: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(12),
                                        ),
                                        color: data.sex == 1
                                            ? Colors.blue[300]
                                            : Color(0xFFff7faa),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
//                                      Icon(Icons.web_asset, size: 10, color: Colors.white,),
                                          Text(
                                            data.sex == 1 ? '♂' : '♀',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      )))
                            ],
                          ),

                          Gaps.vGap4,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 4, right: 6, left: 6, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Color(0xffF3F6FB),
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                                child: Text('90后', style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                ),),
                              ),
                              Gaps.hGap8,
                              Container(
                                padding: EdgeInsets.only(top: 4, right: 6, left: 6, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Color(0xffF3F6FB),
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                                child: Text('电影', style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                ),),
                              )
                            ],
                          ),
                        ],
                      ),
                      Gaps.hGap10,
                    ],
                  ),
                  Text(
                    '${data.distance}km',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff999999),
                    ),
                  ),
//                  Icon(IconFont.icon_pingbi),
//                  Icon(IconFont.icon_kejian),
                ],
              ),
            ),
          ],
        ));
  }
}
