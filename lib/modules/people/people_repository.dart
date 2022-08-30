import 'dart:convert';
import 'dart:io';

import 'package:state_management_session_two/global/global_service/global_service.dart';
import 'package:state_management_session_two/models/person_model.dart';
import 'package:state_management_session_two/models/response_model.dart';

class PeopleRepository {
  PeopleRepository._();

  static Future<ResponseModel<List<PersonModel>>> parsePeople(
    String url,
  ) async {
    try {
      final response = await GlobalService.fetchDate(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          final person = PersonModel.fromMap(data);

          return ResponseModel.success(data: [person]);
        } else {
          final people = PersonModel.parseList(
            data.cast<Map<String, dynamic>>(),
          );

          return ResponseModel.success(data: people);
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
