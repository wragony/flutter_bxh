import 'package:fluro/fluro.dart';
import 'package:flutter_bxh/common/routers/routers.dart';
import 'package:flutter_bxh/main/view/main_page.dart';

class MainRouter implements IRouterProvider {
  static String main = '/main';

  @override
  void initRouter(FluroRouter router) {
    router.define(main, handler: Handler(handlerFunc: (_, __) => const MainPage()));
  }
}
