
//封装输入框
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/gaps.dart';
import '../util/number_text_input_formatter.dart';

class TextFieldItem extends StatelessWidget {
  final String title;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const TextFieldItem(
      {super.key,
        required this.title,
        this.hintText = "",
        this.focusNode,
        this.keyboardType = TextInputType.text,
        this.controller});

  @override
  Widget build(BuildContext context) {
    final Row child = Row(
      children: [
        Text(title),
        Gaps.hGap10,
        Expanded(
            child: Semantics(
              label: hintText.isEmpty ? "请输入$title" : hintText,
              child: TextField(
                focusNode: focusNode,
                keyboardType: keyboardType,
                controller: controller,
                inputFormatters: _getInputFormatters(),
                decoration: InputDecoration(
                    hintText: hintText, border: InputBorder.none //去掉下划线
                ),
              ),
            )),
        Gaps.hGap10
      ],
    );
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(left: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          border:
          Border(bottom: Divider.createBorderSide(context, width: 0.6))),
      child: child,
    );
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (keyboardType == TextInputType.number ||
        keyboardType == TextInputType.phone) {
      return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
    }
    if (keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
      return <TextInputFormatter>[UsNumberTextInputFormatter()];
    }
    return null;
  }
}