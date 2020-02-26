import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String centerTitle;
  final String backImg;
  final bool isBack;
  final VoidCallback onPressed;
  final String actionName;

  const MyAppBar(
      {Key key,
      this.title: '',
      this.centerTitle: '',
      this.backImg: 'assets/images/ic_back_black.png',
      this.isBack: true,
      this.actionName: '',
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Semantics(
                  namesRoute: true,
                  header: true,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 18),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 48),
                  ),
                ),

                isBack ? IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.maybePop(context);
                  },
                  tooltip: 'Back',
                  padding: EdgeInsets.all(12),
                  icon: Image.asset(backImg, color: Colors.black,),
                ) : SizedBox(),
                Positioned(
                  right: 16,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        buttonTheme: ButtonThemeData(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          minWidth: 60.0,
                        )),
                    child: actionName.isEmpty ? Container() : FlatButton(
                      child: Text(actionName, key: const Key('actionName')),
                      onPressed: onPressed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
