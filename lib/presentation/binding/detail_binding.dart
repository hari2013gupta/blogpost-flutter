import 'package:flutter_test21jun/common/app_const.dart';
import 'package:flutter_test21jun/presentation/controller/controllers.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() async {
    // controllers DI
    Get.lazyPut(() => DetailController(),
        fenix: true, tag: tagDetailController);
  }
}
