import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  final Widget child;
  const Popup({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: child,
    );
  }
}
