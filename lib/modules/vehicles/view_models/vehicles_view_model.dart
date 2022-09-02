import 'package:flutter/material.dart';
import 'package:state_management_session_two/models/vehicle_model.dart';
import 'package:state_management_session_two/models/response_model.dart';
import 'package:state_management_session_two/modules/vehicles/vehicles_repository.dart';

class VehiclesViewModel with ChangeNotifier {
  final List<String> vehiclesUrls;
  final List<VehicleModel> vehicles = [];
  var isLoading = false;

  VehiclesViewModel({required this.vehiclesUrls});

  Future<ResponseModel<List<VehicleModel>>> getVehicles() async {
    isLoading = true;
    notifyListeners();

    final allResponses = await Future.wait([
      for (final url in vehiclesUrls) VehiclesRepository.parseVehicles(url),
    ]);

    if (allResponses.any((element) => element.isError)) {
      return allResponses.firstWhere((element) => element.isError);
    }

    for (final response in allResponses) {
      vehicles.addAll(response.data ?? []);
    }

    isLoading = false;
    notifyListeners();

    return ResponseModel.success(data: vehicles);
  }
}
