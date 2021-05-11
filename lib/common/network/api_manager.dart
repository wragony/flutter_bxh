import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bxh/common/network/api_handler.dart';
import 'package:flutter_bxh/common/network/interceptors.dart';
import 'package:flutter_bxh/common/utils/log_util.dart';

///
/// 网络请求
///
class ApiManager {
  // 创建 Dio 实例
  static Dio api = Dio();

  static void init(String baseUrl) {
    api.options.baseUrl = baseUrl;
  }

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path, {String method, Map params, data}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    LogUtil.v('发送的数据为：${data}');
    try {
      api.interceptors.add(HeaderInterceptor());
      Response response = await api.request(path, data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['status'] != 200) {
            LogUtil.v('服务器错误，状态码为：${response.data['status']}');
            return Future.error(response.data['msg']);
          } else {
            LogUtil.v('响应的数据为：${response.data}');
            if (response.data is Map) {
              return response.data;
            } else {
              return json.decode(response.data.toString());
            }
          }
        } catch (e) {
          LogUtil.v('解析响应数据异常:${e}');
          return Future.error('解析响应数据异常');
        }
      } else {
        LogUtil.v('HTTP错误，状态码为：${response.statusCode}');
        String message = ApiResponseHandler.handleHttpError(response.statusCode);
        return Future.error(message);
      }
    } on DioError catch (e, s) {
      var dioError = ApiResponseHandler.handleDioError(e);
      LogUtil.v('请求异常${dioError}');
      return Future.error(dioError);
    } catch (e, s) {
      return Future.error('未知异常:${e}');
    }
  }

  static Future<T> get<T>(String path, {Map params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}
