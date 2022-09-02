import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/person_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/people/people_repository.dart';

class PeopleViewModel with ChangeNotifier {
  final List<String> peopleUrls;
  final List<PersonModel> people = [];
  var isLoading = false;

  PeopleViewModel({required this.peopleUrls});

  Future<ResponseModel<List<PersonModel>>> getPeople() async {
    isLoading = true;
    notifyListeners();

    final allResponses = await Future.wait([
      for (final url in peopleUrls) PeopleRepository.parsePeople(url),
    ]);

    if (allResponses.any((element) => element.isError)) {
      return allResponses.firstWhere((element) => element.isError);
    }

    for (final response in allResponses) {
      people.addAll(response.data ?? []);
    }

    isLoading = false;
    notifyListeners();

    return ResponseModel.success(data: people);
  }
}
