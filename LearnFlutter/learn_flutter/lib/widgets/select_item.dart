import 'package:flutter/material.dart';

import '../res/gaps.dart';
import '../res/resources.dart';

class SelectItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  final String content;

  const SelectItem(
      {super.key, this.onTap, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(right: 8.0, left: 16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            border:
                Border(bottom: Divider.createBorderSide(context, width: 0.6))),
        child: Row(
          children: [
            Text(title),
            Gaps.hGap10,
            Expanded(child: Text(content)),
            Gaps.hGap10,
            Images.arrowRight
          ],
        ),
      ),
    );
  }
}
