import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/species_model.dart';
import 'package:state_management_session_two/modules/species/species_repository.dart';

class SpeciesViewModel with ChangeNotifier {
  final List<String> speciesUrls;
  final List<SpeciesModel> species = [];
  var isLoading = false;

  SpeciesViewModel({required this.speciesUrls});

  void getSpecies() async {
    isLoading = true;
    notifyListeners();

    final allResponses = await Future.wait([
      for (final url in speciesUrls) SpeciesRepository.parseSpecies(url),
    ]);

    for (final response in allResponses) {
      species.addAll(response.data ?? []);
    }

    isLoading = false;
    notifyListeners();
  }
}
