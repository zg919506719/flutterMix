import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/util/theme_utils.dart';
import 'package:learn_flutter/widgets/load_image.dart';

import '../res/dimens.dart';
import '../res/gaps.dart';

class StateLayout extends StatelessWidget {
  final StateType type;
  final String? hintText;

  const StateLayout({super.key, required this.type, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (type == StateType.loading)
          //loading 框
          const CupertinoActivityIndicator(
            radius: 16.0,
            color: Color.fromARGB(1, 10, 1, 1),
          )
        else if (type != StateType.empty)
          //透明度
          Opacity(
              opacity: context.isDark ? 1.0 : 0.5,
              child: LoadAssetImage("state/${type.img}")),
        const SizedBox(
          width: double.infinity,
          height: Dimens.gap_dp16,
        ),
        Text(
          hintText ?? type.hintText
        ),
        Gaps.vGap50
      ],
    );
  }
}

enum StateType {
  //无网络
  network,
  //空
  empty,
  //加载中
  loading
}

extension StateTypeExtension on StateType {
  String get img => <String>[
        "zwdd",
        "zwsp",
        "zwwl",
      ][index];

  String get hintText => <String>[
        "无网络",
        "空",
        "loading",
      ][index];
}
