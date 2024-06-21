import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_test21jun/common/app_const.dart';
import 'package:flutter_test21jun/data/model/post_model.dart';
import 'package:get/get.dart';

import '../client/dio_client.dart';
import '../client/dio_client_impl.dart';

abstract class PostRepository {
  Future<List<PostModel>?> getAllPosts();
  Future<PostModel?> getOnePost(int index);
}

class PostRepositoryImpl extends PostRepository {
  late DioClient _client;

  PostRepositoryImpl() {
    _client = Get.put(DioClientImpl());
  }

  @override
  Future<List<PostModel>?> getAllPosts() async {
    final dio.Response response;
    try {
      response = await _client.getRequest(ApiConstants.postApi, {});
      if (response.statusCode == 200) {
        final responseList =
            (response.data as List).map((x) => PostModel.fromJson(x)).toList();
        return responseList;
      }
      return null;
    // ignore: deprecated_member_use
    } on dio.DioError catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PostModel?> getOnePost(int index) async {
    final dio.Response response;
    try {
      var params = {'id': index};
      response =
          await _client.getRequest('${ApiConstants.postApi}/$index', params);

      debugPrint(response.toString());
      if (response.statusCode == 200) {
        final aiResponse = PostModel.fromJson(response.data);
        return aiResponse;
      }
      return null;
    // ignore: deprecated_member_use
    } on dio.DioError catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
