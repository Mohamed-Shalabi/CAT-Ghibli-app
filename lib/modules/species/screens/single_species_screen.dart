import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/modules/species/view_models/single_species_view_model.dart';

class SingleSpeciesScreen extends StatelessWidget {
  const SingleSpeciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleSpeciesViewModel>();
    final species = viewModel.species;
    return Scaffold(
      appBar: AppBar(
        title: Text(species.name),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${species.id}',
            ),
            Text(
              'Classification: ${species.classification}',
            ),
            Text(
              'Hair Color: ${species.hairColors}',
            ),
            Text(
              'Eye Color: ${species.eyeColors}',
            ),
          ],
        ),
      ),
    );
  }
}
