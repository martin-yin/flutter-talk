import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_talk/pages/dynamic/widget/dynamic_video_widget.dart';
import 'package:flutter_talk/service/event_bus_service.dart';

class DynamicVideoPage extends StatefulWidget {
  @override
  _DynamicVideoPageState createState() => _DynamicVideoPageState();
}

class _DynamicVideoPageState extends State<DynamicVideoPage> {
  SwiperController _controller = SwiperController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Swiper(
          scrollDirection: Axis.vertical,
          autoplay: false,
          controller: _controller,
          itemCount: 2,
          itemBuilder: _swiperBuilder,
          onIndexChanged: (index) {
            eventBus.emit(keyPlayVideo + index.toString(), index);
          }
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {

    return Container();
//    return DynamicVideoWidget(positionTag: index,);
  }
}
