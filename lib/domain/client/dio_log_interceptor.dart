import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      'REQUEST[${options.method}] => PATH: ${options.path} '
      // '=> HEADERS: ${options.headers} '
      '=> Request Param: ${options.data} '
      '=> Request Query: ${options.queryParameters} ',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode},${response.statusMessage}] => PATH: ${response.requestOptions.path}' // '\n=> HEADERS: ${response.headers}'
      '=> DATA: [NOT SHOWN]', //${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode},${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
