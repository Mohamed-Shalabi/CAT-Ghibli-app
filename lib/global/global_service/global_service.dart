import 'package:http/http.dart' as http;

class GlobalService {
  GlobalService._();

  static Future<http.Response> fetchDate(String url) async {
    final uri = Uri.tryParse(url)!;
    return await http.get(uri);
  }
}
