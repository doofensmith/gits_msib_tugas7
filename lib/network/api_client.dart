import 'package:http/http.dart';
import 'dart:convert';

import '../common/constant.dart';
import '../models/post.dart';

class ApiClient {
  int page;
  int perPage;
  ApiClient({
    required this.page,
    required this.perPage,
  });

  Future<List<Post>> getPostData() async {
    Uri uri = Uri.parse(
      '${Constant.baseUrlPost}?page=$page&per_page=$perPage',
    );
    Response response = await get(uri);
    return postFromJson(response.body).toList();
  }
}
