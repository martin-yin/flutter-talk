import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

import 'nomore_widget.dart';

class TalkAppListView extends StatefulWidget {

  final Widget child;
  final RefreshCallback onRefresh;
  final LoadMoreCallback onloadMore;

  final EasyRefreshController controller;

  const TalkAppListView({Key key, this.onRefresh, this.onloadMore, this.child, this.controller}) : super(key: key);


  @override
  _TalkAppListViewState createState() => _TalkAppListViewState();
}

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class _TalkAppListViewState extends State<TalkAppListView> {

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      taskIndependence: true,
      enableControlFinishLoad: true,
      header: MaterialHeader(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation(Color(0xFFff7faa)),
      ),
      footer: NomoreWdiget(),
      controller: widget.controller,
      child: widget.child,
      onRefresh: widget.onRefresh,
      onLoad: widget.onloadMore,

    );
  }
}
