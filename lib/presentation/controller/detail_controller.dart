import 'package:flutter/material.dart';
import 'package:flutter_test21jun/common/app_const.dart';
import 'package:flutter_test21jun/data/model/post_model.dart';
import 'package:flutter_test21jun/domain/repo/post_repo.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find(tag: tagDetailController);
  late PostModel seletedPost;
  var isLoading = false.obs;
  var postTitle = ''.obs;
  var postBody = ''.obs;

  late PostRepository _postRepository;
  int postId = 0;

  @override
  void onInit() {
    super.onInit();
    _postRepository = Get.find<PostRepositoryImpl>();
    final args = Get.arguments;
    debugPrint('initial argument=$args');
    seletedPost =
        PostModel(userId: 0, id: 0, title: 'No post found!', body: '');
    if (args != null) {
      postId = args['post_id'];
      fetchPostbyId();
    }
  }

  void fetchPostbyId() async {
    isLoading(true);
    final result = await _postRepository
        .getOnePost(postId)
        .onError((error, stackTrace) => null);
    isLoading(false);
    if (result != null) {
      seletedPost = result;
      update();
    } else {
      appSnackbar('', 'No data found!');
    }
  }
}
