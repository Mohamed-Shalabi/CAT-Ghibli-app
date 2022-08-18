import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/modules/locations/view_models/single_location_view_model.dart';

class SingleLocationScreen extends StatelessWidget {
  const SingleLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleLocationViewModel>();
    final location = viewModel.location;
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${location.id}',
            ),
            Text(
              'Climate: ${location.climate}',
            ),
            Text(
              'Surface Water: ${location.surfaceWater}',
            ),
            Text(
              'Terrain: ${location.terrain}',
            ),
          ],
        ),
      ),
    );
  }
}
