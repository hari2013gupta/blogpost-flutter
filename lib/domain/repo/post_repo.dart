import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_test21jun/app/app_const.dart';
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
    } on dio.DioException catch (e) {
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
      // final formData = FormData.fromMap({
      //   'name': 'dio',
      //   'date': DateTime.now().toIso8601String(),
      //   'file':
      //       await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      //   'files': [
      //     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      //     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      //   ]
      // });
      var params = {'id': index};
      response =
          await _client.getRequest('${ApiConstants.postApi}/$index', params);

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } on dio.DioException catch (e) {
      debugPrint(e.message);
      return null;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
