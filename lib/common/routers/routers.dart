import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/routers/not_found_page.dart';
import 'package:flutter_bxh/common/widgets/webview_page.dart';
import 'package:flutter_bxh/main/main_router.dart';

// ignore: avoid_classes_with_only_static_members

abstract class IRouterProvider {
  void initRouter(FluroRouter router);
}

class Routes {
  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    // router.define(home, handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => const Home()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    _listRouter.clear();

    _listRouter.add(MainRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
