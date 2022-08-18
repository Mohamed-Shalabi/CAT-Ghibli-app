import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/functions/global_functions.dart';
import 'package:state_management_session_two/modules/people/screens/single_person_screen.dart';
import 'package:state_management_session_two/modules/people/view_models/people_view_model.dart';
import 'package:state_management_session_two/modules/people/view_models/single_person_view_model.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PeopleViewModel>();
    final people = viewModel.people;
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                for (final person in people)
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        Provider(
                          create: (_) => SinglePersonViewModel(person: person),
                          child: const SinglePersonScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(person.name),
                    ),
                  ),
              ],
            ),
    );
  }
}
