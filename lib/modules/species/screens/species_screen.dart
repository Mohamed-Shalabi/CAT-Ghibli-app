import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/global_functions.dart';
import 'package:state_management_session_two/modules/species/screens/single_species_screen.dart';
import 'package:state_management_session_two/modules/species/view_models/species_view_model.dart';
import 'package:state_management_session_two/modules/species/view_models/single_species_view_model.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SpeciesViewModel>();
    final species = viewModel.species;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Species'),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                for (final singleSpecies in species)
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        Provider(
                          create: (_) => SingleSpeciesViewModel(
                            species: singleSpecies,
                          ),
                          child: const SingleSpeciesScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(singleSpecies.name),
                    ),
                  ),
              ],
            ),
    );
  }
}
