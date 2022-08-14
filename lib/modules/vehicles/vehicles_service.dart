import 'package:http/http.dart' as http;
import 'package:state_management_session_two/global/constants.dart';

class VehiclesService {
  VehiclesService._();

  static Future<http.Response> fetchVehicles() async {
    final Uri uri = Uri.parse('$endpoint/locations');
    return await http.get(uri);
  }
}