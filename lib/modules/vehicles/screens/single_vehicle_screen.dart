import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/modules/vehicles/view_models/single_vehicle_view_model.dart';

class SingleVehicleScreen extends StatelessWidget {
  const SingleVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleVehicleViewModel>();
    final vehicle = viewModel.vehicle;
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${vehicle.id}',
            ),
            Text(
              'Description: ${vehicle.description}',
            ),
            Text(
              'Length: ${vehicle.length}',
            ),
            Text(
              'Vehicle Class: ${vehicle.vehicleClass}',
            ),
          ],
        ),
      ),
    );
  }
}
