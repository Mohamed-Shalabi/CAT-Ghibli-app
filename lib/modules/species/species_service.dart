import 'package:http/http.dart' as http;
import 'package:state_management_session_two/global/constants.dart';

class SpeciesService {
  SpeciesService._();

  static Future<http.Response> fetchSpecies() async {
    final Uri uri = Uri.parse('$endpoint/species');
    return await http.get(uri);
  }
}