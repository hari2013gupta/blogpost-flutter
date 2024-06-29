import 'package:flutter_test21jun/domain/client/dio_client_impl.dart';
import 'package:get/get.dart';

abstract class DioClient extends GetxService {

  Future<DioClient> init();

  Future<dynamic> getRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postRequest(String url, Map<String, dynamic>? params);

  Future<dynamic> postMultipartRequest(String url, Object? formData);

  Future<dynamic> setRequest(String url, DioMethod method, Map<String, dynamic>? params);
  
}