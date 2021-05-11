import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class PlatformUtils {
  /// 是否是生产环境
  /// 当App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = const bool.fromEnvironment("dart.vm.product");

  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  static Future<List<dynamic>> getAppVersion() async {
    var result = [];
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    result.add(packageInfo.buildNumber);
    result.add(packageInfo.version);
    return result;
  }

  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }

  ///判断网络是否可用
  static Future<bool> isNetWorkAvailable() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  ///0 - none | 1 - mobile | 2 - WIFI
  static Future<int> getNetWorkType() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return 1;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return 2;
    } else if (connectivityResult == ConnectivityResult.none) {
      return 0;
    }
    return 0;
  }
}
