import 'package:http/http.dart' as http;
import 'package:state_management_session_two/global/constants.dart';

class AllAnimeService {
  AllAnimeService._();

  static Future<http.Response> fetchAllAnime() async {
    final Uri uri = Uri.parse('$endpoint/films');
    return await http.get(uri);
  }
}
