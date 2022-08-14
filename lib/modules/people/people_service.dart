import 'package:http/http.dart' as http;
import 'package:state_management_session_two/global/constants.dart';

class PeopleService {
  PeopleService._();

  static Future<http.Response> fetchPeople() async {
    final Uri uri = Uri.parse('$endpoint/people');
    return await http.get(uri);
  }
}