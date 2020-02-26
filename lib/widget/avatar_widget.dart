import 'package:flutter/material.dart';
import 'package:flutter_talk/widget/load_image.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const AvatarWidget(this.url, {Key key, this.width, this.height}) : super(key: key);@override
  Widget build(BuildContext context) {
    return ClipOval(
      child: LoadImage(url, width: width, height: height,),
    );
  }
}
