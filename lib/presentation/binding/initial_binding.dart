import 'package:flutter_test21jun/domain/repo/post_repo.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    // repo DI
    Get.lazyPut(() => PostRepositoryImpl(), fenix: true);
  }
}
