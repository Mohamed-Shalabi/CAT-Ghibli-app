import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/models/location_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/locations/locations_service.dart';

class LocationsRepository {
  LocationsRepository._();

  static Future<ResponseModel<List<LocationModel>>> parseLocations() async {
    try {
      final response = await LocationsService.fetchLocations();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = LocationModel.parseList(result);

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
