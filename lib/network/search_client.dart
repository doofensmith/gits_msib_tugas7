import 'package:gits_msib_tugas7/models/search.dart';
import 'package:http/http.dart';

class SearchClient {
  static Future<List<Search>> getResponse(String query) async {
    Uri uri = Uri.http(
      'gits-msib.my.id',
      '/wp-json/wp/v2/search',
      <String, dynamic>{
        'q': query,
      },
    );

    Response response = await get(uri);
    return searchFromJson(response.body).toList();
  }
}
