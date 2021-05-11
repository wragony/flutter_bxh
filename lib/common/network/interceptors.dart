import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bxh/common/utils/platform_util.dart';

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = 1000 * 5;
    options.receiveTimeout = 1000 * 5;

    List<dynamic> appVersions = await PlatformUtils.getAppVersion();
    var version = Map()
      ..addAll({
        'versionCode': appVersions.first,
        'versionName': appVersions.last,
      });
    options.headers['version'] = version;
    options.headers['platform'] = Platform.operatingSystem;
    super.onRequest(options, handler);
  }
}
