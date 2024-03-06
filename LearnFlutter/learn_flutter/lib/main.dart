import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/learn_localizations.dart';
import 'package:learn_flutter/login/web_page.dart';
import 'package:learn_flutter/login/web_page1.dart';
import 'package:learn_flutter/net/dio_utils.dart';
import 'package:learn_flutter/net/interceptor.dart';
import 'package:learn_flutter/provider/locale_provider.dart';
import 'package:learn_flutter/provider/table_provide.dart';
import 'package:learn_flutter/provider/theme_provider.dart';
import 'package:learn_flutter/res/constant.dart';
import 'package:learn_flutter/routers/not_found_page.dart';
import 'package:learn_flutter/routers/routers.dart';
import 'package:learn_flutter/util/device_utils.dart';
import 'package:learn_flutter/util/handle_error_utils.dart';
import 'package:learn_flutter/util/log_utils.dart';
import 'package:learn_flutter/util/theme_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:sp_util/sp_util.dart';

import 'home/splash_page.dart';

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
    // it should be the first line in main method

    runApp(MyApp(home: const WebPage1(),));
  });

  /// 隐藏状态栏。为启动页、引导页设置。完成后修改回显示状态栏。
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  // TODO(weilu): 启动体验不佳。状态栏、导航栏在冷启动开始的一瞬间为黑色，且无法通过隐藏、修改颜色等方式进行处理。。。
  // 相关问题跟踪：https://github.com/flutter/flutter/issues/73351
}

class MyApp extends StatelessWidget {
  final Widget? home;
  final ThemeData? theme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  MyApp({super.key, this.home, this.theme}) {
    Log.init();
    _initDio();
    Routes.initRoutes();
    initQuickActions();
  }

  void _initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];
    //身份请求头
    interceptors.add(AuthInterceptor());

    //打印log
    interceptors.add(LoggingInterceptor());

    // 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(baseUrl: "", interceptors: interceptors);
  }

  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvide()),
        ChangeNotifierProvider(create: (context) => TableProvide())
      ],
      child: Consumer2<ThemeProvider, LocaleProvide>(
        builder: (BuildContext context, ThemeProvider value,
            LocaleProvide value2, Widget? child) {
          return buildMaterialApp(value, value2);
        },
      ),
    );

    return OKToast(
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: app);
  }

  void initQuickActions() {
    if (Device.isMobile) {
      const QuickActions quickActions = QuickActions();
      if (Device.isIOS) {
        // Android每次是重新启动activity，所以放在了splash_page处理。
        // 总体来说使用不方便，这种动态的方式在安卓中局限性高。这里仅做练习使用。
        quickActions.initialize((String shortcutType) async {
          if (shortcutType == 'demo') {
            navigatorKey.currentState?.push<dynamic>(MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const NotFoundPage(),
              // builder: (BuildContext context) => const DemoPage(),
            ));
          }
        });
      }

      quickActions.setShortcutItems(<ShortcutItem>[
        const ShortcutItem(
            type: 'demo', localizedTitle: 'Demo', icon: 'flutter_dash_black'),
      ]);
    }
  }

  Widget buildMaterialApp(
      ThemeProvider themeProvider, LocaleProvide localeProvide) {
    return MaterialApp(
      title: "",
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染
      theme: theme ?? themeProvider.getTheme(),
      darkTheme: themeProvider.getTheme(isDarkMode: true),
      themeMode: themeProvider.getThemeMode(),
      home: home ?? const SplashPage(),
      onGenerateRoute: Routes.router.generator,
      localizationsDelegates: LearnLocalizations.localizationsDelegates,
      supportedLocales: LearnLocalizations.supportedLocales,
      locale: localeProvide.locale,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        /// 仅针对安卓
        if (Device.isAndroid) {
          /// 切换深色模式会触发此方法，这里设置导航栏颜色
          ThemeUtils.setSystemNavigationBar(themeProvider.getThemeMode());
        }

        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: child!);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotFoundPage());
      },
    );
  }
}
