import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/resource_mananger.dart';
import 'package:flutter_bxh/main/main_router.dart';

import 'common/routers/fluro_navigator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    delayStarter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          //Future最终值为false时，则当前路由不出栈(不会返回)；最终值为true时，当前路由出栈退出
          return Future.value(false);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Image.asset(
              ImageHelper.wrapAssets('common/app_start_logo.png'),
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> delayStarter() async {
    Future.delayed(Duration(milliseconds: 1500), () {
      NavigatorUtils.push(context, MainRouter.main, replace: true);
    });
  }
}
