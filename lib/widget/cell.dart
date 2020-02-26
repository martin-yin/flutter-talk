import 'package:flutter/material.dart';
import 'package:flutter_talk/widget/gaps.dart';

class Cell extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final String desc;

  const Cell({Key key, this.onTap, @required this.title, @required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.white,
      focusColor: Colors.white,
      onTap: onTap,
      child: Container(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w800),
                  ),
                  Gaps.vGap8,
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              )
            ),
            Container(
              child: Image.asset(
                'assets/images/ic_arrow_right.png',
                width: 18,
                height: 18,
              ),
            )
          ],
        ),
      )
    );

  }
}
