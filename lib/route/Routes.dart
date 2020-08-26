import 'package:flutter/widgets.dart';
import 'widget.dart';
import 'package:aoyanews/login/login.dart';
import 'package:aoyanews/home/home_page.dart';

class Routers {
  static const NAME_WEB_VIEW = "webview";
  static GlobalKey<NavigatorState> _navKey;
  static void setupNavKey(GlobalKey<NavigatorState> key) {
    _navKey = key;
  }

  static Future _push(
    BuildContext context,
    WidgetBuilder builder, {
    String name,
    bool removeUtil,
    bool enablePushTransition,
    bool enablePopTransition,
  }) {
    final route = AppRoute(
      builder: builder,
      enablePushTransition: enablePushTransition,
      enablePopTransition: enablePopTransition,
      settings: name == null ? null : RouteSettings(name: name),
    );
    if (removeUtil == true) {
      return Navigator.of(context).pushAndRemoveUntil(
        route,
        (route) => route == null,
      );
    }
    return Navigator.of(context).push(route);
  }

//OrRegister
  static Future pushLogin(BuildContext context,
      {bool removeUtil, bool enablePushTransition}) {
    return _push(context, (_) => LoginPage(),
        removeUtil: removeUtil, enablePushTransition: enablePushTransition);
  }

  static Future pushHomepage(BuildContext context,
      {bool removeUtil, bool enablePushTransition}) {
    return _push(context, (_) => HomePage(),
        removeUtil: removeUtil, enablePushTransition: enablePushTransition);
  }
}
