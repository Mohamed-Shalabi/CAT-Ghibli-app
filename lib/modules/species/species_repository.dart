import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/global/global_service/global_service.dart';
import 'package:state_management_session_two/models/species_model.dart';
import 'package:state_management_session_two/models/response_model.dart';

class SpeciesRepository {
  SpeciesRepository._();

  static Future<ResponseModel<List<SpeciesModel>>> parseSpecies(
      String url,
      ) async {
    try {
      final response = await GlobalService.fetchDate(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          final person = SpeciesModel.fromMap(data);

          return ResponseModel(
            statusCode: response.statusCode,
            data: [person],
          );
        } else {
          final species = SpeciesModel.parseList(
            data.cast<Map<String, dynamic>>(),
          );

          return ResponseModel(
            statusCode: response.statusCode,
            data: species,
          );
        }
      } else {
        return ResponseModel.error();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.networkError();
      }

      return ResponseModel.error();
    }
  }
}
