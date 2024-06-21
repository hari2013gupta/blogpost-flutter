import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test21jun/app/app_const.dart';
import 'package:flutter_test21jun/domain/client/dio_client.dart';
import 'package:flutter_test21jun/domain/client/dio_log_interceptor.dart';

class DioClientImpl extends DioClient {
  late Dio _dio;
  static const connectTimeout = Duration(seconds: 50);
  static const receiveTimeout = Duration(seconds: 30);

  @override
  Future getRequest(String url, Map<String, dynamic>? params) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint(e.message);
        throw Exception(e.message);
      } else {
        debugPrint(e.message);
        throw Exception(e.message);
      }
    }
    return response;
  }

  @override
  Future<DioClient> init() async {
    _dio = Dio();
    _dio.interceptors.clear();
    _dio.interceptors.add(DioLogInterceptor());
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
    _dio.options.baseUrl = ApiConstants.baseUrl;
    return this;
  }
}
