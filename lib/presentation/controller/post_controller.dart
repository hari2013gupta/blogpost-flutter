import 'package:flutter_test21jun/common/app_const.dart';
import 'package:flutter_test21jun/data/model/post_model.dart';
import 'package:flutter_test21jun/domain/repo/post_repo.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get to => Get.find(tag: tagPostController);
  List<PostModel> postList = <PostModel>[].obs;
  late PostRepository _postRepository;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _postRepository = Get.find<PostRepositoryImpl>();
    fetchPosts();
  }

  fetchPosts() async {
    postList.clear();
    isLoading(true);
    final result = await _postRepository
        .getAllPosts()
        .onError((error, stackTrace) => null);
    isLoading(false);
    if (result != null) {
      postList.clear();
      postList.addAll(result);
    } else {
      appSnackbar('', 'No data found!');
    }
  }
}
