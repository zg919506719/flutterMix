import 'package:flutter/material.dart';
import 'package:learn_flutter/res/constant.dart';
import 'package:learn_flutter/routers/routers.dart';
import 'package:learn_flutter/util/handle_error_utils.dart';
import 'package:learn_flutter/util/log_utils.dart';
import 'package:learn_flutter/widgets/state_layout.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  if (Constant.inProduction) {
    //正式环境下不打印
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  ///todo 去除URL中的“#”(hash)，仅针对Web。默认为setHashUrlStrategy
  /// 注意本地部署和远程部署时`web/index.html`中的base标签，https://github.com/flutter/flutter/issues/69760
  //setPathUrlStrategy();

  //异常处理
  handleError(() async {
    /// 确保初始化完成
    WidgetsFlutterBinding.ensureInitialized();

    /// sp初始化
    await SpUtil.getInstance();

    /// 1.22 预览功能: 在输入频率与显示刷新率不匹配情况下提供平滑的滚动效果
    // GestureBinding.instance?.resamplingEnabled = true;
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final Widget? home;
  final ThemeData? theme;

  MyApp({super.key, this.home, this.theme}) {
    Log.init();
    Routes.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text("首页"),
    );
  }
}
