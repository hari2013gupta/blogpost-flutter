import 'package:get/get.dart';

abstract class DioClient extends GetxService {

  Future<DioClient> init();

  Future<dynamic> getRequest(String url, Map<String, dynamic>? params);
  
}