import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/location_model.dart';
import 'package:state_management_session_two/modules/locations/locations_repository.dart';

class LocationsViewModel with ChangeNotifier {
  final List<String> locationsUrls;
  final List<LocationModel> locations = [];
  var isLoading = false;

  LocationsViewModel({required this.locationsUrls});

  void getLocations() async {
    isLoading = true;
    notifyListeners();

    final allResponses = await Future.wait([
      for (final url in locationsUrls) LocationsRepository.parseLocations(url),
    ]);

    for (final response in allResponses) {
      locations.addAll(response.data ?? []);
    }

    isLoading = false;
    notifyListeners();
  }
}
