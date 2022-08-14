import 'package:http/http.dart' as http;
import 'package:state_management_session_two/global/constants.dart';

class LocationsService {
  LocationsService._();

  static Future<http.Response> fetchLocations() async {
    final Uri uri = Uri.parse('$endpoint/locations');
    return await http.get(uri);
  }
}