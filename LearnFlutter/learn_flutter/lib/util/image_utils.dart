import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';

class ImageUtils {
  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    return "assets/images/$name.${format.value}";
  }

  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static ImageProvider getImageProvider(String? imgUrl,
      {String holdImg = 'none'}) {
    if (TextUtil.isEmpty(imgUrl)) {
      return AssetImage(getImgPath(holdImg));
    }
    return CachedNetworkImageProvider(imgUrl!);
  }
}

enum ImageFormat { png, jpg, gif, webp, svg }

extension ImageFormatExtension on ImageFormat {
  String get value => ["png", "jpg", "gif", "webp", "svg"][index];
}
