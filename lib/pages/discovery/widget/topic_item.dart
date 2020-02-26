import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {

  final String topic;
  final Function onTap;
  const TopicItem(this.topic, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 8),
        decoration: BoxDecoration(
          color: Color(0xfff9f9f9),
          borderRadius: BorderRadius.circular(30.0),
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFFff7faa),
                shape: BoxShape.circle,
              ),
              child: Text('#', style: TextStyle(color: Colors.white, fontSize: 12),),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Text(topic, style: TextStyle(color: Color(0xFFff7faa), fontSize: 13,),),
            )
          ],
        ),
      )
    );

  }
}

//'# 双子座那些事情',
//style: const TextStyle(
//color: Colors.white,
//fontSize: 12,
//),
