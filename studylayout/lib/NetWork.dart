import 'dart:convert';
// import 'dart:io';
// import 'package:connectivity/connectivity.dart'; //网络监听组件
// import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

typedef NetError = Function(int code, String msg);
typedef NetSuccess = Function(dynamic data);
enum NetEnvironment { local, dev, qa, pro }

class NetWork {
  Dio dio;
  static final NetEnvironment netEnvironment = NetEnvironment.local;

  Map<String, dynamic> headers() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'b': '',
      'c': '',
      'token': ''
      // ...
    };
  }

  String baseUrl() {
    switch (netEnvironment) {
      case NetEnvironment.local:
        return 'http://localhost:37100';
        break;
      case NetEnvironment.dev:
        return 'http://localhost:37100';
        break;
      case NetEnvironment.qa:
        return 'http://localhost:37100';
        break;
      case NetEnvironment.pro:
        return 'http://localhost:37100';
        break;
      default:
        return '';
    }
  }

  NetWork() {
    BaseOptions options = BaseOptions();
    options.baseUrl = baseUrl();
    options.connectTimeout = 10000;
    options.receiveTimeout = 10000;
    options.sendTimeout = 10000;
    options.responseType = ResponseType.plain;
    options.headers = headers();
    dio = Dio(options);
    dio.interceptors.add(CookieManager(CookieJar()));
  }

  get(String url, Map<String, dynamic> params, NetSuccess success,
      NetError error) async {
    print('get请求启动! url：$url ,body: $params');
    if (url == null || url.length == 0) {
      return;
    }
    Response response;
    try {
      response =
          await dio.get(url, queryParameters: params != null ? params : {});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        var code = json['code'];
        if (code.toString() == '0') {
          success(json['body']);
        } else {
          var msg = json['msg'];
          error(code, msg);
        }
      } else {
        error(response.statusCode, response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  post(String url, Map<String, dynamic> params, NetSuccess success,
      NetError error) async {
    print('post请求启动! url：$url ,body: $params');
    if (url == null || url.length == 0) {
      return;
    }
    Response response;
    try {
      response = await dio.post(url, data: params != null ? params : {});
      var data = response.data;
      if (response.statusCode == 200) {
        var json = jsonDecode(data);
        var code = json['code'];
        if (code.toString() == '0') {
          success(json['body']);
        } else {
          var msg = json['msg'];
          error(code, msg);
        }
      } else {
        error(response.statusCode, response.statusMessage);
      }
      print(
        'post请求结束! url：$url ,body: $params, result: $data',
      );
    } catch (e) {
      print(e);
    }
  }
}
