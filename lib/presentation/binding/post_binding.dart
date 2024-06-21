import 'package:flutter_test21jun/app/app_const.dart';
import 'package:flutter_test21jun/presentation/controller/controllers.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() async {
    // controllers DI
    Get.lazyPut(() => PostController(), fenix: true, tag: tagPostController);
  }
}
