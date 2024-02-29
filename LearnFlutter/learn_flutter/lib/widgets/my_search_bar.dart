import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/util/theme_utils.dart';
import 'package:learn_flutter/widgets/my_button.dart';

import '../res/colors.dart';
import '../res/dimens.dart';
import '../res/gaps.dart';
import 'load_image.dart';

/*要实现自定义AppBar，需要注意两点：
1、AppBar不是平常自定义组件简单的继承StatelessWidget或者StatefulWidget，它还必须实现PreferredSizeWidget
2、必须重写preferredSize，preferredSize必须要有return*/
class MySearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String backImg;
  final void Function(String)? onPressed;

  const MySearchBar(
      {super.key,
      this.backImg = 'images/ic_back_black.png',
      this.onPressed});

  @override
  State<MySearchBar> createState() => _MySearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _MySearchBarState extends State<MySearchBar> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    final Color iconColor =
        isDark ? Colours.dark_text_gray : Colours.text_gray_c;
    //Semantics 辅助作用
    final Widget back = Semantics(
      label: "返回",
      child: SizedBox(
        width: 48,
        height: 48,
        child: InkWell(
          onTap: () {
            Navigator.maybePop(context);
          },
          borderRadius: BorderRadius.circular(24.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(widget.backImg),
          ),
        ),
      ),
    );

    final Widget textField = Expanded(
        child: Container(
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: isDark ? Colours.dark_material_bg : Colours.bg_gray),
      child: TextField(
        key: const Key("search_text_field"),
        controller: _controller,
        focusNode: _focus,
        textInputAction: TextInputAction.search,
        onSubmitted: (String val) {
          _focus.unfocus();
          //点击软键盘的动作按钮时的回调
          widget.onPressed?.call(val);
        },
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: -8.0, right: -16.0, bottom: 14.0),
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: LoadAssetImage(
                "order/order_search",
                color: iconColor,
              ),
            ),
            suffixIcon: GestureDetector(
              child: LoadAssetImage(
                "order/order_delete",
                color: iconColor,
              ),
              onTap: () {
                /// https://github.com/flutter/flutter/issues/35848
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  _controller.text = "";
                });
              },
            )),
      ),
    ));
    final Widget search = MyButton(
        minHeight: 32.0,
        minWidth: 44.0,
        fontSize: Dimens.font_sp14,
        radius: 4.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        text: '搜索',
        onPressed: () {
          _focus.unfocus();
          widget.onPressed?.call(_controller.text);
        });

    ///状态栏
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Material(
          child: SafeArea(
            child: Row(
              children: [back, textField, Gaps.hGap10, search, Gaps.hGap10],
            ),
          ),
        ),
        value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focus.dispose();
    _controller.dispose();
  }
}
