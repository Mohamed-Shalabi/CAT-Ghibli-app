import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/models/person_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/people/people_service.dart';

class PeopleRepository {
  PeopleRepository._();

  static Future<ResponseModel<List<PersonModel>>> parsePeople() async {
    try {
      final response = await PeopleService.fetchPeople();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = PersonModel.parseList(result);

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
