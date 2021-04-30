import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bxh/common/routers/not_found_page.dart';
import 'package:flutter_bxh/common/routers/routers.dart';
import 'package:flutter_bxh/splash.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/res/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() : super() {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialApp app = MaterialApp(
      title: '棒小孩成长记',
      theme: ThemeData(
        primarySwatch: Colours.white,
      ),
      home: SplashPage(),
      onGenerateRoute: Routes.router.generator,
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const NotFoundPage(),
        );
      },
    );
    SizedBox loadingIcon = SizedBox(
      width: 25.0,
      height: 25.0,
      child: const CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: Colours.text_gray,
      ),
    );

    /// Toast 配置
    return OKToast(
        child: RefreshConfiguration(
          headerBuilder: () => WaterDropHeader(
            refresh: loadingIcon,
          ),
          // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
          footerBuilder: () => ClassicFooter(
            loadingIcon: loadingIcon,
          ),
          // 配置默认底部指示器
          headerTriggerDistance: 80.0,
          // 头部触发刷新的越界距离
          springDescription: SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
          // 自定义回弹动画,三个属性值意义请查询flutter api
          maxOverScrollExtent: 100,
          //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
          maxUnderScrollExtent: 0,
          // 底部最大可以拖动的范围
          enableScrollWhenRefreshCompleted: true,
          //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
          enableLoadingWhenFailed: true,
          //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
          hideFooterWhenNotFull: false,
          // Viewport不满一屏时,禁用上拉加载更多功能
          enableBallisticLoad: true,
          // 可以通过惯性滑动触发加载更多
          child: app,
        ),
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.center);
  }
}
