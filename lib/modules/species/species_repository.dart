import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/models/species_model.dart';
import 'package:state_management_session_two/modules/species/species_service.dart';

class SpeciesRepository {
  SpeciesRepository._();

  static Future<ResponseModel<List<SpeciesModel>>> parseSpecies() async {
    try {
      final response = await SpeciesService.fetchSpecies();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = SpeciesModel.parseList(result);

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
