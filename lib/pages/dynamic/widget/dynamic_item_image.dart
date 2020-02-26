import 'package:flutter/material.dart';
import 'package:flutter_talk/widget/load_image.dart';

class DynamicItemImage extends StatelessWidget {

  final List<String> image;

  final Function onTap;

  const DynamicItemImage({Key key, this.image, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return image.length > 1 ?  GridItemImage() : ItemImage();
  }

  Widget ItemImage () {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: LoadImage(image[0], fit: BoxFit.cover),
          )),
    );
  }


  Widget GridItemImage() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: image.length > 9 ? 9 : image.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LoadImage(image[index], fit: BoxFit.cover)),
            ));
      },
    );
  }

}
