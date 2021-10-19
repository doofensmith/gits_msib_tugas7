import 'package:http/http.dart';
import 'dart:convert';

import '../common/constant.dart';
import '../models/post.dart';

class ApiClient {
  Future<List<Post>> getPostData(int page, int perPage) async {
    Uri uri = Uri.parse(
      '${Constant.baseUrlPost}?page=$page&per_page=$perPage',
    );
    Response response = await get(uri);
    return postFromJson(response.body).toList();
  }
}
