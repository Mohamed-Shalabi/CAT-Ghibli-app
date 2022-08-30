import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/global/global_service/global_service.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/models/vehicle_model.dart';

class VehiclesRepository {
  VehiclesRepository._();

  static Future<ResponseModel<List<VehicleModel>>> parseVehicles(
    String url,
  ) async {
    try {
      final response = await GlobalService.fetchDate(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          final person = VehicleModel.fromMap(data);

          return ResponseModel.success(
            data: [person],
          );
        } else {
          final vehicles = VehicleModel.parseList(
            data.cast<Map<String, dynamic>>(),
          );

          return ResponseModel.success(
            data: vehicles,
          );
        }
      } else {
        return ResponseModel.unknownError();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.networkError();
      }

      return ResponseModel.unknownError();
    }
  }
}
