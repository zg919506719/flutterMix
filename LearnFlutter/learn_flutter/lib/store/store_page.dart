import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/res/dimens.dart';
import 'package:learn_flutter/res/gaps.dart';
import 'package:learn_flutter/routers/fluro_navigator.dart';
import 'package:learn_flutter/util/theme_utils.dart';
import 'package:learn_flutter/widgets/my_app_bar.dart';
import 'package:learn_flutter/widgets/text_field_item.dart';

import '../res/resources.dart';
import '../res/styles.dart';
import '../shop/shop_router.dart';
import '../util/number_text_input_formatter.dart';
import '../widgets/select_image.dart';
import '../widgets/select_item.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final GlobalKey<SelectImageState> _imageGlobalKey =
      GlobalKey<SelectImageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: "填写表单",
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.hGap10,
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "店铺资料",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: SelectImage(
                  key: _imageGlobalKey,
                ),
              ),
              Gaps.hGap10,
              Center(
                child: Text("店主手持身份证或营业执照",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: Dimens.font_sp14)),
              ),
              Gaps.hGap10,
              const TextFieldItem(
                title: "银行卡号",
                keyboardType: TextInputType.number,
                hintText: "填写银行卡号",
              ),
              SelectItem(
                title: "主营范围",
                content: _sortName,
                onTap: () => _showBottomSheet(),
              ),
              SelectItem(
                title: "选择位置",
                content: "",
                onTap: () {
                  NavigatorUtils.pushResult(
                      context, ShopRouter.addressSelectPage, (result) {
                        //带结果返回
                        debugPrint("$result");
                  });
                },
              ),
              TextButton(
                  onPressed: () {
                    debugPrint(
                        "文件路径${_imageGlobalKey.currentState?.pickedFile?.path}");
                  },
                  child: Text("提交"))
            ],
          )
          /*    KeyboardActions(
          config: KeyboardActionsConfig(),
          tapOutsideBehavior: TapOutsideBehavior.opaqueDismiss,
          child: ,
        ),*/
          ),

      /// 同时存在底部按钮与keyboardConfig配置时，为保证Android与iOS平台软键盘弹出高度正常，添加下面的代码。
      resizeToAvoidBottomInset: true,
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            builder: (
              BuildContext context,
              ScrollController scrollController,
            ) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  //点击效果，墨水池
                  return InkWell(
                    child: Container(
                      child: Text(_list[index]),
                    ),
                    onTap: () {
                      setState(() {
                        _sortName = _list[index];
                      });
                      NavigatorUtils.goBack(context);
                    },
                  );
                },
                itemExtent: 48,
                itemCount: _list.length,
              );
            },
            expand: false,
          );
        });
  }

  String _sortName = '';

  final List<String> _list = [
    '水果生鲜',
    '家用电器',
    '休闲食品',
    '茶酒饮料',
    '美妆个护',
    '粮油调味',
    '家庭清洁',
    '厨具用品',
    '儿童玩具',
    '床上用品'
  ];
}
