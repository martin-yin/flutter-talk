import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'gaps.dart';

class NomoreWdiget extends Footer {
  final Key key;
  final double displacement;
  final LinkFooterNotifier linkNotifier = LinkFooterNotifier();

  NomoreWdiget({this.key,
    this.displacement = 40.0,
    completeDuration = const Duration(seconds: 1),
    bool enableHapticFeedback = false,
    bool enableInfiniteLoad = true,
  }): super(
    float: true,
    extent: 52.0,
    triggerDistance: 52.0,
    completeDuration: completeDuration == null
        ? Duration(milliseconds: 300,)
        : completeDuration + Duration(milliseconds: 300,),
    enableHapticFeedback: enableHapticFeedback,
    enableInfiniteLoad: enableInfiniteLoad,
  );

  @override
  Widget contentBuilder(BuildContext context, LoadMode loadState,
      double pulledExtent, double loadTriggerPullDistance,
      double loadIndicatorExtent, AxisDirection axisDirection,
      bool float, Duration completeDuration, bool enableInfiniteLoad,
      bool success, bool noMore) {
    linkNotifier.contentBuilder(context, loadState, pulledExtent,
        loadTriggerPullDistance, loadIndicatorExtent, axisDirection, float,
        completeDuration, enableInfiniteLoad, success, noMore);
    return NomoreFooterWidget(
      key: key,
      displacement: displacement,
      linkNotifier: linkNotifier,
    );
  }
}



class NomoreFooterWidget extends StatefulWidget {
  final double displacement;
  final Animation<Color> valueColor;
  final Color backgroundColor;
  final LinkFooterNotifier linkNotifier;
  const NomoreFooterWidget({
    Key key,
    this.displacement,
    this.valueColor,
    this.backgroundColor,
    this.linkNotifier,
  }) : super(key: key);



  @override
  _NomoreFooterWidgetState createState() => _NomoreFooterWidgetState();
}

class _NomoreFooterWidgetState extends State<NomoreFooterWidget> {
  bool get _noMore => widget.linkNotifier.noMore;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _noMore ? Gaps.empty : CupertinoActivityIndicator(),
          _noMore ? Gaps.empty : Gaps.hGap5,
          /// 只有一页的时候，就不显示FooterView了
          Text(_noMore ? '没有了呦~' : '正在加载中... '),
        ],
      ),
    );
  }
}