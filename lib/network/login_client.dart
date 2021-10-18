import 'package:gits_msib_tugas7/common/constant.dart';
import 'package:gits_msib_tugas7/models/login.dart';
import 'package:http/http.dart';

class LoginClient {
  static Future<Login> loginCheck({
    required String username,
    required String password,
  }) async {
    Uri uri = Uri.parse(Constant.baseUrlAuth);
    Response _response = await post(
      uri,
      body: <String, String>{'username': username, 'password': password},
    );
    return Login.fromJson(_response.body);
  }
}
