import 'dart:convert';

import 'package:uri/scr/feature/post/models/base_model.dart';

import '../../../common/constants/api_constants.dart';
import '../../../common/services/api_service.dart';
import '../models/post_model.dart';

abstract interface class IPostRepository {
  const IPostRepository();

  Future<List<PostModel>> getAllPosts();

  Future<List<PostModel>> searchPosts(String query);
}

class PostRepositoryImpl implements IPostRepository {
  final APIService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<PostModel>> getAllPosts() async {
    String response = await apiService.request(ApiConst.allPostPath);
    BaseModel baseModel = BaseModel.fromJson(jsonDecode(response));
    return baseModel.posts;
  }

  @override
  Future<List<PostModel>> searchPosts(String query) async {
    String response = await apiService.request(
      ApiConst.searchPostsPath,
      queryParametersAll: ApiConst.searchParams(query),
    );
    BaseModel baseModel1 = BaseModel.fromJson(jsonDecode(response));
    return baseModel1.posts;
  }
}
