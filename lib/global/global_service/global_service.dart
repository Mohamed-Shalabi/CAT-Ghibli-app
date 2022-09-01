import 'package:http/http.dart' as http;

class GlobalService {
  GlobalService._();

  static Future<http.Response> fetchData(String url) async {
    final uri = Uri.tryParse(url)!;
    return await http.get(uri);
  }
}
