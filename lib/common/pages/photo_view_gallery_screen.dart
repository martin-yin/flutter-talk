import 'package:flutter/material.dart';
import 'package:flutter_talk/provider/common_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

class PhotoViewGalleryScreen extends StatefulWidget {
  final List<String> images = [];
  final int index;
  final String heroTag;
  PageController pageController;

  PhotoViewGalleryScreen(
      {Key key, this.heroTag = '', this.pageController, this.index: 0})
      : super(key: key) {
    pageController = PageController(initialPage: 0);
  }

  @override
  _PhotoViewGalleryScreenState createState() => _PhotoViewGalleryScreenState();
}

class _PhotoViewGalleryScreenState extends State<PhotoViewGalleryScreen> {
  int currentIndex = 0;

  List<String> images = [];

  @override
  void initState() {
    super.initState();
     images = Provider.of<CommonProvider>(context, listen: false).dynamicImageList;
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(images[index]),
                        heroAttributes: widget.heroTag.isNotEmpty
                            ? PhotoViewHeroAttributes(tag: widget.heroTag)
                            : null,
                      );
                    },
                    itemCount: images.length,
                    loadingChild: Container(),
                    backgroundDecoration: null,
                    pageController: widget.pageController,
                    enableRotation: true,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
            ),
            Positioned(//右上角关闭按钮
              right: 10,
              top: MediaQuery.of(context).padding.top,
              child: IconButton(
                icon: Icon(Icons.close,size: 30,color: Colors.white,),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              //图片index显示
              top: MediaQuery.of(context).padding.top + 15,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text("${currentIndex + 1}/${images.length}",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      )

    );
  }
}
