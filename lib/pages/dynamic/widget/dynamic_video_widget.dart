//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_talk/service/event_bus_service.dart';
//import 'package:flutter_talk/widget/gaps.dart';
//import 'package:video_player/video_player.dart';
//
//class DynamicVideoWidget extends StatefulWidget {
//  final int positionTag;
//
//  const DynamicVideoWidget({Key key, this.positionTag}) : super(key: key);
//
//  @override
//  _DynamicVideoWidgetState createState() => _DynamicVideoWidgetState();
//}
//
//class _DynamicVideoWidgetState extends State<DynamicVideoWidget> {
//  VideoPlayerController _controller;
//  Future _initializeVideoPlayerFuture;
//  bool videoPrepared = false;
//
//  @override
//  void initState() {
//    _controller = VideoPlayerController.asset('assets/images/video.mp4')
//      ..initialize().then((_) {})
//      ..setLooping(true).then((_) {
//        if (widget.positionTag == 0) {
//          _controller.play();
//          videoPrepared = true;
//        } else {
//          videoPrepared = false;
//        }
//      });
//    _initializeVideoPlayerFuture = _controller.initialize();
//    eventBus.on(keyPlayVideo + widget.positionTag.toString(), (arg) {
//      if (arg == widget.positionTag) {
//        setState(() {
//          _controller.play();
//          videoPrepared = true;
//        });
//      } else {
//        setState(() {
//          _controller.pause();
//        });
//      }
//    });
//    super.initState();
//  }
//
//  @override
//  void dispose() {
////    eventBus.off(keyPlayVideo + widget.positionTag.toString());
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: ConstrainedBox(
//          constraints: BoxConstraints.expand(),
//          child: Stack(
//            alignment: Alignment.center,
//            children: <Widget>[
//              GestureDetector(
//                onTap: () {
//                  if (_controller.value.isPlaying) {
//                    _controller.pause();
//                  } else {
//                    _controller.play();
//                  }
//                },
//                child: Container(
//                    child: FutureBuilder(
//                      future: _initializeVideoPlayerFuture,
//                      builder: (context, snapshot) {
//                        print(snapshot.connectionState);
//                        if (snapshot.hasError) print(snapshot.error);
//                        if (snapshot.connectionState == ConnectionState.done) {
//                          return AspectRatio(
//                            aspectRatio: _controller.value.aspectRatio,
//                            child: VideoPlayer(_controller),
//                          );
//                        } else {
//                          return Center(
//                            child: CircularProgressIndicator(),
//                          );
//                        }
//                      },
//                    )
//                ),
//              ),
//              Positioned(
//                top: 0,
//                left: 0,
//                child: VideoAppBar(),
//              )
//            ],
//          )),
//    );
//  }
//}
//
//class VideoAppBar extends StatelessWidget implements PreferredSizeWidget {
//  @override
//  Widget build(BuildContext context) {
//    return AnnotatedRegion<SystemUiOverlayStyle>(
//        value: SystemUiOverlayStyle.light,
//        child: SafeArea(
//            child: Container(
//              width: MediaQuery.of(context).size.width,
//              height: kToolbarHeight,
//              padding: EdgeInsets.only(left: 0, right: 15),
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                      child:
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          IconButton(
//                            onPressed: () {
//                              FocusScope.of(context).unfocus();
//                              Navigator.maybePop(context);
//                            },
//                            padding:
//                            EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
//                            icon: Image.asset(
//                              'assets/images/ic_back_black.png',
//                              color: Colors.white,
//                            ),
//                          ),
//                          Container(
//                            width: 36,
//                            height: 36,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              image: DecorationImage(
//                                image: NetworkImage(
//                                  'https://img2.woyaogexing.com/2020/02/07/bc5c623d1e0648c1b300f702fd944c86!400x400.jpeg',
//                                ),
//                              ),
//                            ),
//                          ),
//                          Gaps.hGap12,
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Text(
//                                '木哒',
//                                style: TextStyle(
//                                  fontSize: 16,
//                                  fontFamily: 'PingFang-SC-Medium',
//                                  color: Colors.white,
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: 2),
//                              ),
//                              Text(
//                                '这个人很懒啥都没写~',
//                                style: TextStyle(
//                                  fontSize: 14,
//                                  fontFamily: 'PingFang-SC-Medium',
//                                  color: Colors.white,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ],
//                      )),
//                  Container(
//                      child: FlatButton(
//                        onPressed: null,
//                        child: Text(
//                          '关注',
//                          style: TextStyle(
//                            fontFamily: 'PingFang-SC-Medium',
//                            color: Colors.white,
//                            fontSize: 14,
//                          ),
//                        ),
//                      ),
//                      height: 30,
//                      width: 60,
//                      decoration: BoxDecoration(
//                        color: Color(0xFFff7faa),
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(18),
//                        ),
//                      ))
//                ],
//              ),
//            )));
//  }
//
//  @override
//  Size get preferredSize => Size.fromHeight(48.0);
//}
