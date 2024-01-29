import 'package:flutter/cupertino.dart';

class ImageUtils {
  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    return "assets/images/$name.${format.value}";
  }

  static ImageProvider getAssetImage(String name,{ImageFormat format=ImageFormat.png}){
    return AssetImage(getImgPath(name,format: format));
  }
}

enum ImageFormat { png, jpg, gif, webp,svg }

extension ImageFormatExtension on ImageFormat {
  String get value => ["png", "jpg", "gif", "webp", "svg"][index];
}
