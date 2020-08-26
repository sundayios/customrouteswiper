import 'package:aoyanews/route/Routes.dart';
// import 'package:VPN/widgets/index.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class WebViewRouteObserver extends RouteObserver<PageRoute> {
  final _webViewPlugin = FlutterWebviewPlugin();

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);

    if (previousRoute?.settings?.name == Routers.NAME_WEB_VIEW) {
      // 从 WebView 去到其他页面
      _webViewPlugin.hide();
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings?.name == Routers.NAME_WEB_VIEW) {
      // 从其他页面回到 WebView
      _webViewPlugin.show();
    }
  }
}
