import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面错误'),
      ),
      body: Container(
        child: Text('未找到页面~'),
      ),
    );
  }
}
