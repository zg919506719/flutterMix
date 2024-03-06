import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage1 extends StatelessWidget {
  const WebPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("file:///android_asset/flutter_assets/assets/site/index.html#page_periodical/index"))),
        // initialFile: "file:///android_asset/flutter_assets/assets/site/index.html#/page_periodical/index",
        // initialFile: "assets/site/index.html#page_periodical/index",
    );
  }
}
