import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'application.dart';


class NavigatorUtils {

  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native);
  }

  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }
}

