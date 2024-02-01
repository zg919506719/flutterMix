import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../res/colors.dart';
import '../util/device_utils.dart';
import '../util/image_utils.dart';
import '../util/theme_utils.dart';
import '../util/toast_utils.dart';

class SelectImage extends StatefulWidget {
  final double size;
  final String? url;
  final String? heroTag;

  const SelectImage({super.key, this.size = 80, this.url, this.heroTag});

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  ImageProvider? _imageProvider;
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;

  Future<void> _getImage() async {
    try {
      pickedFile =
          await _picker.pickImage(source: ImageSource.gallery, maxWidth: 800);
      if (pickedFile != null) {
        if (Device.isWeb) {
          _imageProvider = NetworkImage(pickedFile!.path);
        } else {
          _imageProvider = FileImage(File(pickedFile!.path));
        }
      } else {
        _imageProvider = null;
      }
      setState(() {});
    } catch (e) {
      if (e is MissingPluginException) {
        Toast.show('当前平台暂不支持！');
      } else {
        Toast.show('没有权限，无法打开相册！');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorFilter colorFilter = ColorFilter.mode(
        ThemeUtils.isDark(context)
            ? Colours.dark_unselected_item_color
            : Colours.text_gray,
        BlendMode.srcIn);

    Widget image = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: _imageProvider ??
                  ImageUtils.getImageProvider(widget.url,
                      holdImg: "store/icon_zj"))),
    );

    //相当于共享元素，两个组件共用一个
    if (widget.heroTag != null && !Device.isWeb) {
      image = Hero(tag: widget.heroTag!, child: image);
    }
    //帮助视觉有障碍的人士
    return Semantics(
      label: "选择图片",
      hint: "跳转相册选择图片",
      //水波纹（覆盖）
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: _getImage,
        child: image,
      ),
    );
  }
}
