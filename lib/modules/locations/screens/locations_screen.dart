import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/navigate.dart';
import 'package:state_management_session_two/modules/locations/screens/single_location_screen.dart';
import 'package:state_management_session_two/modules/locations/view_models/locations_view_model.dart';
import 'package:state_management_session_two/modules/locations/view_models/single_location_view_model.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationsViewModel>();
    final locations = viewModel.locations;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                for (final location in locations)
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        Provider(
                          create: (_) => SingleLocationViewModel(
                            location: location,
                          ),
                          child: const SingleLocationScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(location.name),
                    ),
                  ),
              ],
            ),
    );
  }
}
