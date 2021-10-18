import 'dart:convert';

import 'package:http/http.dart' as https;

import '../common/constant.dart';
import '../models/post.dart';

class ApiClient {
  Future<Post> getPostData() async {
    Uri uri = Uri.parse(Constant.baseUrlPost);
    https.Response response = await https.get(uri);
    var post = postFromJson(response.body);
    return post;
  }

// Future<List<Post>> getPostData() async {
//     Uri uri = Uri.parse(Constant.baseUrlPost);
//     https.Response response = await https.get(uri);
//     return postFromJson(response.body);
//   }
}
