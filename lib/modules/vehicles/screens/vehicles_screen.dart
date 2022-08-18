import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/global_functions.dart';
import 'package:state_management_session_two/modules/vehicles/screens/single_vehicle_screen.dart';
import 'package:state_management_session_two/modules/vehicles/view_models/vehicles_view_model.dart';
import 'package:state_management_session_two/modules/vehicles/view_models/single_vehicle_view_model.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VehiclesViewModel>();
    final vehicles = viewModel.vehicles;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
      ),
      body: viewModel.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView(
        children: [
          for (final vehicle in vehicles)
            InkWell(
              onTap: () {
                navigateTo(
                  context,
                  Provider(
                    create: (_) => SingleVehicleViewModel(
                      vehicle: vehicle,
                    ),
                    child: const SingleVehicleScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(vehicle.name),
              ),
            ),
        ],
      ),
    );
  }
}
