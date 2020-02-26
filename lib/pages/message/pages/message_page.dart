import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_talk/pages/message/widget/user_item_widget.dart';
import 'package:flutter_talk/widget/app_bar.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}
const List<ListUser> userList = [
  ListUser(
      avatar: 'https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg',
      name: '木木哒',
      count: 9,
      time: '20s',
      content: '╬═☆丕傠ぬ丕迎匼，丕夠傠囍狚炔洎怞ルo~~~~',
  ),
  ListUser(
    avatar: 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1581254220&di=799f8a0eac0289636333fb5ab4f97512&src=http://i0.hdslb.com/bfs/face/59ecdc9605313e6ec76f32fd27fffd8cf968f44e.jpg',
    name: '奥里给',
    count: 2,
    time: '25s',
    content: '奥里给干了兄弟们~',
  ),
  ListUser(
    avatar: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581264416495&di=c9b67040ea565ea0dc3e40abe38a04a4&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F2c9860df892595d76c5d4d7c9e556d72f8062051.jpg',
    name: 'Dio',
    count: 1,
    time: '21:18',
    content: 'wryyyyyyyyyyyyyyyyy~',
  ),
  ListUser(
    avatar: 'http://09imgmini.eastday.com/mobile/20191206/20191206230145_6917ba7b2e54195a642674b474fd5068_2.jpeg',
    name: '癌坤~',
    count: 4,
    time: '21:18',
    content: '唱跳rap music~鸡你太美~',
  ),
  ListUser(
    avatar: 'https://img2.woyaogexing.com/2020/02/14/79c9df02200f49caabaad1f4e8caedcb!400x400.jpeg',
    name: '木头',
    count: 4,
    time: '21:18',
    content: '~~~~',
  ),
];


class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: '消息中心', isBack: false,),
      body: SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                  height: 94,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/message/message.png'),
                          ),
                          SizedBox(height: 12,),
                          Text('消息通知', style: TextStyle(color: Color(0xff666666), fontSize: 14),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/message/@me.png'),
                          ),
                          SizedBox(height: 12,),
                          Text('@我', style: TextStyle(color: Color(0xff666666), fontSize: 14),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/message/loveme.png'),
                          ),
                          SizedBox(height: 12,),
                          Text('收到的赞', style: TextStyle(color: Color(0xff666666), fontSize: 14),)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/message/system_message.png'),
                          ),
                          SizedBox(height: 12,),
                          Text('系统通知', style: TextStyle(color: Color(0xff666666), fontSize: 14),)
                        ],
                      ),
                    ],
                  )
              ),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                ),
              ),
              Container(
                child: ListView.builder(
                    itemCount: userList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return UserItemWidget(data: userList[index], onTap: () {print('111');},);
                    }),
              ),
            ],
          )
      ),
    );
  }
}
