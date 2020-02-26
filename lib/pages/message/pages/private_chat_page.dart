import 'package:flutter/material.dart';
import 'package:flutter_talk/widget/app_bar.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';

class PrivateChatPage extends StatefulWidget {
  @override
  _PrivateChatPageState createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  List<MessageModel> data = [
    MessageModel(
      message: '你好呀~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: false,
    ),
    MessageModel(
      message: '你好~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/98a96d81d9e9492c84ce3b3e74548a10!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '怎么称呼？',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: false,
    ),
    MessageModel(
      message: 'Martin',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/98a96d81d9e9492c84ce3b3e74548a10!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '人间迷惑行为',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: false,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
    MessageModel(
      message: '重启大法~',
      avatar:
          'https://img2.woyaogexing.com/2020/02/24/6b47fc86451b4f00af229e0136bca59e!400x400.jpeg',
      self: true,
    ),
  ];

  TextEditingController _textController;


  void _handleSubmitted(String text) {
    _textController.clear();//清空文本框
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '123',
      ),
      body: Container(
        height: double.infinity,
        color: Color(0xfff5f5f5),
        padding: EdgeInsets.only(top: 15,),
        child: Column(
          children: <Widget>[
            Flexible(
                child: SingleChildScrollView(
                    child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0),
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return MessageItem(data: data[index]);
              },
            ))),
            Divider(height: 1.0),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.mic,
                    color: Colors.lightBlue,
                    size: 24,
                  ),

                  Expanded(
                    child: TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: new InputDecoration.collapsed(hintText: '发送消息'),
                    ),
                  ),
                  Icon(Icons.send, color: Color(0xFFff7faa),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final MessageModel data;

  const MessageItem({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 15),
      child: data.self == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(4),
                    ),
                    color: Color(0xFFff7faa),
                  ),
                  child: Text(
                    data.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Gaps.hGap8,
                AvatarWidget(data.avatar, width: 40, height: 40,)
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AvatarWidget(data.avatar, width: 40, height: 40,),
                Gaps.hGap8,
                Container(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, right: 6, left: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(4),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Colors.blue[300],
                  ),
                  child: Text(
                    data.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class MessageModel {
  final String message;

  final String avatar;

  final bool self;

  const MessageModel({this.message, this.avatar, this.self});
}
