// import 'package:flutter/material.dart';
//
// import 'package:webview_flutter/webview_flutter.dart';
//
// class WebPage extends StatelessWidget {
//   const WebPage({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     var _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       // ..Uri.file('/android_asset/$assetFilePath').toString()
//       //  ..loadFlutterAsset("assets/web/index.html");
//        ..loadFile("file:///android_asset/flutter_assets/assets/site/index.html#/page_periodical/index");
//       // ..loadRequest(uri)
//       // ..loadFile('/android_asset/assets/web/index.html#/map');
//     _controller.setNavigationDelegate(NavigationDelegate(
//       onPageFinished: (url){
//         print("onPageFinished"+url);
//       },
//       onUrlChange: (url){
//         print("onUrlChange"+url.toString());
//       },
//     ));
//     return Scaffold(
//       appBar: AppBar(title: Text('WebView Example')),
//       body: Container(
//         child: WebViewWidget(
//             controller: _controller
//         ),
//       ),
//     );
//   }
// }
