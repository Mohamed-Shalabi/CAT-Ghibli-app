import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/models/vehicle_model.dart';
import 'package:state_management_session_two/modules/vehicles/vehicles_service.dart';

class VehiclesRepository {
  VehiclesRepository._();

  static Future<ResponseModel<List<VehicleModel>>> parseVehicles() async {
    try {
      final response = await VehiclesService.fetchVehicles();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = VehicleModel.parseList(result);

        return ResponseModel(
          statusCode: response.statusCode,
          data: animeModels,
        );
      } else {
        return ResponseModel(statusCode: -1);
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel(
          statusCode: -1,
          message: 'Check your internet connection',
        );
      }

      return ResponseModel(
        statusCode: -1,
        message: 'An error occurred',
      );
    }
  }
}
