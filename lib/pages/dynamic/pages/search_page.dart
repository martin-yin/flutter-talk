import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_talk/util/icon_font.dart';
import 'package:flutter_talk/widget/avatar_widget.dart';
import 'package:flutter_talk/widget/gaps.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Gaps.vGap8,
                Gaps.vGap15,
                Text(
                  '热门推荐',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.vGap15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        '飞鱼服',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        '第一次恋爱',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        '去哪里吃',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        '前任',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666)),
                      ),
                    ),
                  ],
                ),
                Gaps.vGap8,
                Gaps.vGap15,
                Text(
                  '热门话题',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.vGap15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                AvatarWidget('https://img2.woyaogexing.com/2020/02/14/28976d190bb84d4dae4d5e3f9297052f!400x400.jpeg', width: 40, height: 40,),
                                Gaps.hGap12,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' #新人前来报到#',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff333333)),
                                    ),
                                    Gaps.vGap8,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          IconFont.icon_redu,
                                          color: Color(0xFFff7faa),
                                          size: 16,
                                        ),
                                        Text(
                                          ' 19239人参与',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff666666)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    '参与',
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
                                ))
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(48.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Container(
              child: Row(
            children: <Widget>[
              Semantics(
                label: '返回',
                child: SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.maybePop(context);
                    },
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      key: const Key('search_back'),
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/ic_back_black.png',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextField(
                    key: const Key('srarch_text_field'),
//                      autofocus: true,
                    controller: _controller,
                    maxLines: 1,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (val) {
                      FocusScope.of(context).unfocus();
                      // 点击软键盘的动作按钮时的回调
//                          widget.onPressed(val);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 0.0, left: -8.0, right: -16.0, bottom: 14.0),
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 8.0),
                        child: Image.asset(
                          'assets/images/icon_search.png',
                          color: Color(0xFFcccccc),
                        ),
                      ),
                      hintText: '请输入您要搜索的内容~',
                      suffixIcon: GestureDetector(
                        child: Semantics(
                          label: '清空',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 8.0, bottom: 8.0),
                            child: Image.asset(
                              'assets/images/order_delete.png',
                              color: Color(0xFFcccccc),
                            ),
                          ),
                        ),
                        onTap: () {
                          /// https://github.com/flutter/flutter/issues/36324
//                              SchedulerBinding.instance.addPostFrameCallback((_) {
//                                _controller.text = '';
//                              });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.hGap8,
              Theme(
                data: Theme.of(context).copyWith(
                  buttonTheme: ButtonThemeData(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 32.0,
                      minWidth: 44.0,
                      materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // 距顶部距离为0
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      )),
                ),
                child: FlatButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
//                        widget.onPressed(_controller.text);
                  },
                  child: Text('搜索', style: TextStyle(fontSize: 14)),
                ),
              ),
              Gaps.hGap16,
            ],
          )),
        ),
      ),
    );
  }
}
