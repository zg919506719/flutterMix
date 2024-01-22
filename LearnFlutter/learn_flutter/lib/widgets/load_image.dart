import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/util/image_utils.dart';

class LoadAssetImage extends StatelessWidget {
  final String image;
  final ImageFormat format;

  const LoadAssetImage(this.image, {super.key, this.format = ImageFormat.png});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageUtils.getImgPath(image, format: format)
/*    ,   height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
      /// 忽略图片语义
      excludeFromSemantics: true,*/
    );
  }
}
